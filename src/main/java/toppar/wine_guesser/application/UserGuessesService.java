package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.UserGuesses;
import toppar.wine_guesser.repository.UserGuessesRepository;

import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class UserGuessesService {

    @Autowired
    private UserGuessesRepository userGuessesRepository;

    public void saveUserGuesses(String username, String gameId, List<String> descriptionGuesses, List<String> servingOrderGuesses){
        for(int i = 0; i < servingOrderGuesses.size(); i++){
            userGuessesRepository.save(new UserGuesses(username, gameId, descriptionGuesses.get(i), Integer.valueOf(servingOrderGuesses.get(i))));
        }
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
}
