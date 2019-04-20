package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.GameResultRepository;

import java.time.LocalDateTime;
import java.util.*;
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
    @Autowired
    private JudgementService judgementService;
    @Autowired
    private MatchHistoryService matchHistoryService;
    @Autowired
    private UserResultsService userResultsService;

    public void create(GameResult gameResult){
        gameResultRepository.save(gameResult);
    }

    public GameStats generateGameStatsForGameWithId(String gameId, String username){

        GameResult gameResult = new GameResult(gameId, "http://192.168.0.100:8080/gameResults/"+gameId);
        gameResultRepository.save(gameResult);

        //Calculating points
        List<GameSettings> gameSettingsList = gameSettingsService.getAllByGameId(gameId);
        List<String> participants = lobbyDataService.getParticipantsByGameId(gameId);

        String datePlayed = LocalDateTime.now().toString();

        int numberOfWines = gameSettingsService.getAllByGameId(gameId).size();
        Map<String, UserResultData> userResultDataMap = new HashMap<>();
        for(int j = 0; j < participants.size(); j++){
            UserResults userResults = userResultsService.findByUsername(participants.get(j));
            matchHistoryService.create(new MatchHistory(userResults.getUserResultsId(), datePlayed, "http://192.168.0.100:8080/gameResults/"+gameId, gameId));
            userResultDataMap.put(participants.get(j), new UserResultData(participants.get(j), 0, 0, 0));
        }

        //calculating resultData
        for(int i = 0; i < gameSettingsList.size(); i++){
            int currentWineServingOrder = i + 1;
            GameSettings gameSettings = gameSettingsService.findGameSettingsByServingOrderAndGameId(String.valueOf(currentWineServingOrder), gameId);
            String currentWineDescription = gameSettings.getDescription();
            int userGrade = judgementService.findPersonalGrade(username, gameId, Integer.valueOf(gameSettings.getServingOrder()));
            double averageGrade = judgementService.findAverageGradeByServingOrderAndGameId(Integer.valueOf(gameSettings.getServingOrder()), gameId);
            for(int j = 0; j < participants.size(); j++){
                String guessedDescription = userGuessesService.getDescriptionGuessByGameIdUsernameAndServingOrderGuess(gameId, participants.get(j), currentWineServingOrder);
                if(checkIfDescriptionsAreEqual(currentWineDescription, guessedDescription)){
                    resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentWineServingOrder,
                            gameSettings.getImgSource(), gameSettings.getWineName(), gameSettings.getDescription(), 1, gameSettings.getUrl(), userGrade, averageGrade));
                    userResultDataMap.get(participants.get(j)).increasePointsCollected(1);
                }else{
                    resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentWineServingOrder,
                            gameSettings.getImgSource(), gameSettings.getWineName(), gameSettings.getDescription(), 0, gameSettings.getUrl(), userGrade, averageGrade));
                }


            }
        }


        //calculating gamePoint
        int totalPoints = 0;
        for(int i = 0; i < participants.size(); i++){
            List<ResultData> resultDataList = resultDataService.getAllByUsernameAndGameResultId(participants.get(i), gameResult.getGameResultId());
            for(int j = 0; j < resultDataList.size(); j++){
                if(resultDataList.get(j).getGrade() == 1){
                    totalPoints++;
                }
            }

            gamePointService.createNew(new GamePoint(gameResult.getGameResultId(), participants.get(i), totalPoints));
            totalPoints = 0;

            UserResults userResults = userResultsService.findByUsername(participants.get(i));
            double pointsCollected = userResultDataMap.get(participants.get(i)).getPointCollected();
            double oldPercent = userResults.getCorrectPercent();
            double gamesPlayed = userResults.getPlayedGames();
            double currentPercentCorrect = pointsCollected/numberOfWines;
            double newCorrectPercent = (oldPercent + currentPercentCorrect)/ (gamesPlayed + 1);
            UserResultData userResultData = userResultDataMap.get(participants.get(i));
            userResultData.setGamesPlayed(gamesPlayed + 1);
            userResultData.setNewCorrectPercent(newCorrectPercent);
            userResultData.setUsername(participants.get(i));
            userResultDataMap.replace(participants.get(i), userResultData);

        }

        List<GamePointDTO> gamePointList = gamePointService.getAllByGameResultId(gameResult.getGameResultId());
        gamePointList.sort(Comparator.comparing(GamePointDTO::getPoints).reversed());

        List<GamePointDTO> finalGamePointList = gamePointList;
        userResultDataMap.forEach((key, value) -> {
            if (value.getPointCollected() >= finalGamePointList.get(0).getPoints()) {
                double newCorrectPercent = value.getNewCorrectPercent();
                userResultsService.updateByUsername(value.getUsername(), newCorrectPercent, "win");
            } else {
                double newCorrectPercent = value.getNewCorrectPercent();
                userResultsService.updateByUsername(value.getUsername(), newCorrectPercent, "lose");
            }
        });

        gamePointList = sortGamePointListByPoints(gamePointService.getAllByGameResultId(gameResult.getGameResultId()));
        List<ResultDataDTO> resultDataList = resultDataService.getAllByGameResultIdAndUsername(gameResult.getGameResultId(), username);

        return new GameStats(gamePointList, resultDataList, gameId);
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
