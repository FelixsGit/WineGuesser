package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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

    public void saveUserGuesses(String username, String gameId, List<String> descriptionGuesses, List<String> servingOrderGuesses) throws GuessException {
        checkForIfGuessesIsValid(servingOrderGuesses, gameId);
        for(int i = 0; i < servingOrderGuesses.size(); i++){
            userGuessesRepository.save(new UserGuesses(username, gameId, descriptionGuesses.get(i), Integer.valueOf(servingOrderGuesses.get(i))));
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
        }catch(Exception e){
                throw new GuessException(e.getMessage());
        }
    }

    public void removeAllByGameId(String gameId){
        userGuessesRepository.removeAllByGameId(gameId);
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
        return userGuessesRepository.findAllByGameIdAndUsername(gameId, username);
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
        if(userGuessesRepository.findAllByGameIdAndUsername(gameId, username).size() == 0){ ;
            return false;
        }
        System.out.println("user has made a guess");
        return true;
    }
}
