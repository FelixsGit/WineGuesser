package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.GameResultRepository;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class GameResultService {

    @Autowired
    private GameResultRepository gameResultRepository;
    @Autowired
    private LobbyDataService lobbyDataService;
    @Autowired
    private GameSettingsService gameSettingsService;
    @Autowired
    private UserGuessesService userGuessesService;
    @Autowired
    private ResultDataService resultDataService;
    @Autowired
    private GamePointService gamePointService;


    public GameStats generateGameStatsForGameWithId(String gameId, String username){

        GameResult gameResult = new GameResult(gameId, "http://192.168.0.100:8080/gameResults/"+gameId);
        gameResultRepository.save(gameResult);

        //Calculating points
        List<GameSettings> gameSettingsList = gameSettingsService.getAllByGameId(gameId);
        List<String> participants = lobbyDataService.getParticipantsByGameId(gameId);

        //calculating resultData
        for(int i = 0; i < gameSettingsList.size(); i++){
            String currentCorrectDescription = gameSettingsList.get(i).getDescription();
            int currentCorrectServingOrder = Integer.valueOf(gameSettingsList.get(i).getServingOrder());
            for(int j = 0; j < participants.size(); j++){
                List<UserGuesses> userGuessesList = userGuessesService.getAllByGameIdAndUsername(gameId, participants.get(j));
                boolean correct = false;
                for(int k = 0; k < userGuessesList.size(); k++){
                    String guessesDescription = userGuessesList.get(k).getDescriptionGuess();
                    int guessedServingOrder = userGuessesList.get(k).getServingOrderGuess();
                    if(checkIfDescriptionsAreEqual(guessesDescription, currentCorrectDescription) && (guessedServingOrder == currentCorrectServingOrder)){
                        correct = true;
                        break;
                    }
                }
                if(correct){
                    resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentCorrectServingOrder,
                            gameSettingsList.get(i).getImgSource(), gameSettingsList.get(i).getWineName(), currentCorrectDescription, 1, gameSettingsList.get(i).getUrl()));
                    correct = false;
                }else{
                    resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentCorrectServingOrder,
                            gameSettingsList.get(i).getImgSource(), gameSettingsList.get(i).getWineName(), currentCorrectDescription, 0, gameSettingsList.get(i).getUrl()));
                }
            }
        }
        //calculating gamePoint
        int totalPoints = 0;
        for(int i = 0; i < participants.size(); i++){
            List<ResultData> resultDataList = resultDataService.getAllByUsername(participants.get(i));
            for(int j = 0; j < resultDataList.size(); j++){
                if(resultDataList.get(j).getGrade() == 1){
                    totalPoints++;
                }
            }
            gamePointService.createNew(new GamePoint(gameResult.getGameResultId(), participants.get(i), totalPoints));
            totalPoints = 0;
        }

        List<GamePointDTO> gamePointList = sortGamePointListByPoints(gamePointService.getAllByGameResultId(gameResult.getGameResultId()));
        List<ResultDataDTO> resultDataList = resultDataService.getAllByGameResultIdAndUsername(gameResult.getGameResultId(), username);

        return new GameStats(gamePointList, resultDataList, gameId);
    }

    public boolean checkIfNewFinishedGame(String gameId){
        return gameResultRepository.findAllByGameId(gameId) != null;
    }

    private List<GamePointDTO> sortGamePointListByPoints(List<GamePointDTO> gamePointDTOList){
        return gamePointDTOList.stream().sorted(Collections.reverseOrder(Comparator.comparing(GamePointDTO::getPoints))).collect(Collectors.toList());
    }

    public GameStats retrieveGameStatsForGameWithIdAndUsername(String gameId, String username){
        GameResult gameResult = gameResultRepository.findAllByGameId(gameId);
        List<GamePointDTO> gamePointList = sortGamePointListByPoints(gamePointService.getAllByGameResultId(gameResult.getGameResultId()));
        List<ResultDataDTO> resultDataList = resultDataService.getAllByGameResultIdAndUsername(gameResult.getGameResultId(), username);
        return new GameStats(gamePointList, resultDataList, gameId);
    }

    private boolean checkIfDescriptionsAreEqual(String one, String two){
        String slice = two.substring(0, 30);
        return one.contains(slice);
    }

}
