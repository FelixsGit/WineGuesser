package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.GameResultRepository;

import java.text.DecimalFormat;
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
    @Autowired
    private GameSetupService gameSetupService;

    public void generateGameStatsForGameWithId(String gameId){

        boolean isClubMatch = false;
        String clubName = gameSetupService.getGameSetupByGameId(gameId).getClubName();
        if(clubName!= null){
            isClubMatch = true;
        }


        GameSetup gameSetup = gameSetupService.getGameSetupByGameId(gameId);
        GameResult gameResult;
        if(gameSetup.getComment() != null){
            gameResult = new GameResult(gameId, "http://192.168.0.100:8080/gameResults/"+gameId, gameSetup.getComment());
        }else{
            gameResult = new GameResult(gameId, "http://192.168.0.100:8080/gameResults/"+gameId, null);
        }

        gameResultRepository.save(gameResult);

        //Calculating points
        List<GameSettings> gameSettingsList = gameSettingsService.getAllByGameId(gameId);
        List<String> participants = lobbyDataService.getParticipantsByGameId(gameId);

        String datePlayed = LocalDateTime.now().toString().substring(0, 10);

        boolean regionGame = false;
        int numberOfWines = gameSettingsList.size();
        for(int i = 0; i < gameSettingsList.size(); i++){
            if(gameSettingsList.get(i).getRegion() != null){
                regionGame = true;
            }
        }

        Map<String, UserResultData> userResultDataMap = new HashMap<>();
        if(isClubMatch){
            for(int j = 0; j < participants.size(); j++){
                UserResults userResults = userResultsService.findByUsername(participants.get(j));
                matchHistoryService.create(new MatchHistory(userResults.getUserResultsId(), datePlayed, "http://192.168.0.100:8080/gameResults/"+gameId, gameId, clubName));
                userResultDataMap.put(participants.get(j), new UserResultData(participants.get(j), 0, 0));
            }
        }else{
            for(int j = 0; j < participants.size(); j++){
                UserResults userResults = userResultsService.findByUsername(participants.get(j));
                matchHistoryService.create(new MatchHistory(userResults.getUserResultsId(), datePlayed, "http://192.168.0.100:8080/gameResults/"+gameId, gameId, null));
                userResultDataMap.put(participants.get(j), new UserResultData(participants.get(j), 0, 0));
            }
        }


        //calculating resultData
        for(int i = 0; i < gameSettingsList.size(); i++){
            int currentWineServingOrder = i + 1;
            boolean currentWineIsRegion = false;
            GameSettings gameSettings = gameSettingsService.findGameSettingsByServingOrderAndGameId(String.valueOf(currentWineServingOrder), gameId);
            String currentWineDescription = gameSettings.getDescription();
            if(gameSettings.getRegion() != null){
                currentWineIsRegion = true;
            }
            double averageGrade = judgementService.findAverageGradeByServingOrderAndGameId(Integer.valueOf(gameSettings.getServingOrder()), gameId);
            for(int j = 0; j < participants.size(); j++) {
                boolean correctGuessOnRegion = false;
                int userGrade = judgementService.findPersonalGrade(participants.get(j), gameId, Integer.valueOf(gameSettings.getServingOrder()));
                String guessedDescription = userGuessesService.getDescriptionGuessByGameIdUsernameAndServingOrderGuess(gameId, participants.get(j), currentWineServingOrder);
                if(currentWineIsRegion){
                    if(userGuessesService.checkIfPlayerHasCurrentServingOrderWithRegionNotNull(participants.get(j), gameSettings, currentWineServingOrder)){
                        System.out.println("correct guess on region for user " + participants.get(j));
                        correctGuessOnRegion = true;
                    }
                }
                if(regionGame){
                    if(checkIfDescriptionsAreEqual(currentWineDescription, guessedDescription)) {
                        if(correctGuessOnRegion){
                            resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentWineServingOrder,
                                    gameSettings.getImgSource(), gameSettings.getWineName(), gameSettings.getDescription(), 2, gameSettings.getUrl(), userGrade, averageGrade,
                                    gameSettings.getRegion(), "rätt."));
                            userResultDataMap.get(participants.get(j)).increasePointCollectedTotal(2);
                            userResultDataMap.get(participants.get(j)).increasePointCollectedWines(1);
                        }else{
                            resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentWineServingOrder,
                                    gameSettings.getImgSource(), gameSettings.getWineName(), gameSettings.getDescription(), 1, gameSettings.getUrl(), userGrade, averageGrade,
                                    gameSettings.getRegion(), "fel."));
                            userResultDataMap.get(participants.get(j)).increasePointCollectedTotal(1);
                            userResultDataMap.get(participants.get(j)).increasePointCollectedWines(1);
                        }
                    }else {
                        if(correctGuessOnRegion){
                            resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentWineServingOrder,
                                    gameSettings.getImgSource(), gameSettings.getWineName(), gameSettings.getDescription(), 1, gameSettings.getUrl(), userGrade, averageGrade,
                                    gameSettings.getRegion(), "rätt."));
                            userResultDataMap.get(participants.get(j)).increasePointCollectedTotal(1);
                        }else{
                            resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentWineServingOrder,
                                    gameSettings.getImgSource(), gameSettings.getWineName(), gameSettings.getDescription(), 0, gameSettings.getUrl(), userGrade, averageGrade,
                                    gameSettings.getRegion(), "fel."));
                            userResultDataMap.get(participants.get(j)).increasePointCollectedTotal(0);
                        }
                    }
                }
                if(!regionGame){
                    if(checkIfDescriptionsAreEqual(currentWineDescription, guessedDescription)) {
                        resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentWineServingOrder,
                                gameSettings.getImgSource(), gameSettings.getWineName(), gameSettings.getDescription(), 1, gameSettings.getUrl(), userGrade, averageGrade,
                                gameSettings.getRegion(), null));
                        userResultDataMap.get(participants.get(j)).increasePointCollectedTotal(1);
                        userResultDataMap.get(participants.get(j)).increasePointCollectedWines(1);

                    }else{
                        resultDataService.createNew(new ResultData(gameResult.getGameResultId(), participants.get(j), currentWineServingOrder,
                                gameSettings.getImgSource(), gameSettings.getWineName(), gameSettings.getDescription(), 0, gameSettings.getUrl(), userGrade, averageGrade,
                                gameSettings.getRegion(), null));
                    }
                }
            }

        }


        //calculating gamePoint
        int totalPoints = 0;
        for(int i = 0; i < participants.size(); i++){
            List<ResultData> resultDataList = resultDataService.getAllByUsernameAndGameResultId(participants.get(i), gameResult.getGameResultId());
            for(int j = 0; j < resultDataList.size(); j++){
                if(resultDataList.get(j).getGrade() != 0){
                    totalPoints += resultDataList.get(j).getGrade();
                }
            }
            gamePointService.createNew(new GamePoint(gameResult.getGameResultId(), participants.get(i), totalPoints));
            totalPoints = 0;

            double pointsCollectedWines = userResultDataMap.get(participants.get(i)).getPointCollectedWines();
            userResultsService.updateUserResultsByUser(participants.get(i), numberOfWines, pointsCollectedWines);
            UserResultData userResultData = userResultDataMap.get(participants.get(i));
            userResultData.setUsername(participants.get(i));
            userResultDataMap.replace(participants.get(i), userResultData);

        }

        List<GamePointDTO> gamePointList = gamePointService.getAllByGameResultId(gameResult.getGameResultId());
        gamePointList.sort(Comparator.comparing(GamePointDTO::getPoints).reversed());

        userResultDataMap.forEach((key, value) -> {
            if (value.getPointCollectedTotal() >= gamePointList.get(0).getPoints()) {
                userResultsService.updateWinOrLoseForUser(value.getUsername(), "win");
            }else{
                userResultsService.updateWinOrLoseForUser(value.getUsername(), "lose");
            }
        });

    }

    private List<GamePointDTO> sortGamePointListByPoints(List<GamePointDTO> gamePointDTOList){
        return gamePointDTOList.stream().sorted(Collections.reverseOrder(Comparator.comparing(GamePointDTO::getPoints))).collect(Collectors.toList());
    }

    public GameStats retrieveGameStatsForGameWithIdAndUsername(String gameId, String username){
        GameResult gameResult = gameResultRepository.findAllByGameId(gameId);
        List<GamePointDTO> gamePointList = sortGamePointListByPoints(gamePointService.getAllByGameResultId(gameResult.getGameResultId()));
        List<ResultDataDTO> resultDataList = resultDataService.getAllByGameResultIdAndUsername(gameResult.getGameResultId(), username);
        return new GameStats(gamePointList, resultDataList, gameId, gameResult.getComment());
    }

    private boolean checkIfDescriptionsAreEqual(String one, String two){
        String slice = two.substring(0, 30);
        return one.contains(slice);
    }


    public GameResult getGameResultByGameId(String gameId) {
        return gameResultRepository.findAllByGameId(gameId);
    }
}
