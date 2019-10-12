package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.GameSettings;
import toppar.wine_guesser.domain.GuessException;
import toppar.wine_guesser.domain.UserGuesses;
import toppar.wine_guesser.repository.UserGuessesRepository;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class UserGuessesService {

    @Autowired
    private UserGuessesRepository userGuessesRepository;
    @Autowired
    private LobbyDataService lobbyDataService;
    @Autowired
    private GameSettingsService gameSettingsService;

    public void saveUserGuesses(String username, String gameId, List<String> descriptionGuesses, List<String> servingOrderGuesses, List<String> regionGuesses) throws GuessException {
        checkForIfGuessesIsValid(servingOrderGuesses, gameId);
        for(int i = 0; i < servingOrderGuesses.size(); i++){
            if(regionGuesses == null){
                userGuessesRepository.save(new UserGuesses(username, gameId, descriptionGuesses.get(i), Integer.valueOf(servingOrderGuesses.get(i)), null));
            }else{
                userGuessesRepository.save(new UserGuesses(username, gameId, descriptionGuesses.get(i), Integer.valueOf(servingOrderGuesses.get(i)), regionGuesses.get(i)));
            }
            lobbyDataService.setDoneTrueForParticipant(username);
        }
    }

    private void checkForIfGuessesIsValid(List<String> servingOrderGuesses, String gameId) throws GuessException{
        Map<Integer, Integer> uniqueMap = new HashMap<>();
        if(servingOrderGuesses.isEmpty()){
            throw new GuessException("empty");
        }
        try {
            for (String servingOrderGuess : servingOrderGuesses) {
                if (Integer.valueOf(servingOrderGuess) > gameSettingsService.getAllByGameId(gameId).size()) {
                    throw new GuessException("to big");
                } else if (Integer.valueOf(servingOrderGuess) <= 0) {
                    throw new GuessException("to small");
                }
                if(uniqueMap.get(Integer.valueOf(servingOrderGuess)) != null){
                    throw new GuessException("same");
                }
                uniqueMap.put(Integer.valueOf(servingOrderGuess), 1);
            }
        }catch(NumberFormatException e){
                throw new GuessException("not a number");
        }
    }

    public void removeAllByGameId(String gameId){
        userGuessesRepository.removeAllBygame_id(gameId);
    }

    public List<String> getDescriptionGuessesByUsername(String username){
        List<UserGuesses> userGuessesList = userGuessesRepository.findAllByUsername(username);
        List<String> descriptionGuesses = new ArrayList<>();
        userGuessesList.forEach(userGuesses -> descriptionGuesses.add(userGuesses.getDescriptionGuess()));
        return descriptionGuesses;
    }

    public List<String> getServingOrderGuessesByUsername(String username){
        List<UserGuesses> userGuessesList = userGuessesRepository.findAllByUsername(username);
        List<String> servingOrderGuesses = new ArrayList<>();
        userGuessesList.forEach(userGuesses -> servingOrderGuesses.add(Integer.toString(userGuesses.getServingOrderGuess())));
        return servingOrderGuesses;
    }
    public List<UserGuesses> getAllByGameIdAndUsername(String gameId, String username){
        return userGuessesRepository.findAllBygame_idAndUsername(gameId, username);
    }

    public String getDescriptionGuessByGameIdUsernameAndServingOrderGuess(String gameId, String username, int servingOrderGuess){
        List<UserGuesses> userGuessesList = userGuessesRepository.findAllByUsernameAndServingOrderGuess(username, servingOrderGuess);
        String descriptionGuess = null;
        for(int i = 0; i < userGuessesList.size(); i++){
            if(userGuessesList.get(i).getUsername().equals(username)){
                descriptionGuess = userGuessesList.get(i).getDescriptionGuess();
            }
        }
        return descriptionGuess;
    }

    public boolean userHasMadeAGuess(String gameId, String username){
        if(userGuessesRepository.findAllBygame_idAndUsername(gameId, username).size() == 0){ ;
            return false;
        }
        System.out.println("user has made a guess");
        return true;
    }

    public String getRegionByGameIdUsernameAndServingOrderGuess(String gameId, String username, int servingOrderGuess) {
        List<UserGuesses> userGuessesList = userGuessesRepository.findAllByUsernameAndServingOrderGuess(username, servingOrderGuess);
        String regionGuess = null;
        for(int i = 0; i < userGuessesList.size(); i++){
            if(userGuessesList.get(i).getUsername().equals(username)){
                if(userGuessesList.get(i).getRegionGuess() != null){
                    regionGuess = userGuessesList.get(i).getRegionGuess();
                }
            }
        }
        return regionGuess;
    }

    public boolean checkIfPlayerHasCurrentServingOrderWithRegionNotNull(String username, GameSettings gameSettings, int currentServingOrder) {
        List<UserGuesses> userGuessesList = userGuessesRepository.findAllByUsername(username);
        for(int i = 0; i < userGuessesList.size(); i++){
            if(gameSettings.getRegion() != null && userGuessesList.get(i).getRegionGuess() != null && currentServingOrder == userGuessesList.get(i).getServingOrderGuess()){
                return true;

            }
        }
        return false;
    }

    private boolean checkIfDescriptionsAreEqual(String one, String two){
        String slice = two.substring(0, 30);
        return one.contains(slice);
    }

    public void removeByUsernameAndGameId(String username, String gameId) {
        userGuessesRepository.removeAllByUsernameAndgame_id(username, gameId);
    }
}
