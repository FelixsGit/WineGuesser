package toppar.wine_guesser.application;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.UserResults;
import toppar.wine_guesser.repository.UserResultsRepository;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class UserResultsService {

    @Autowired
    private UserResultsRepository userResultsRepository;

    public void create(UserResults userResults){
        userResultsRepository.save(userResults);
    }

    public UserResults findByUsername(String username){
        return userResultsRepository.findAllByUsername(username);
    }

    public void updateByUsername(String username, double newCorrectPercent, String winOrLose){
        if(winOrLose.equals("win")){
            UserResults userResults = userResultsRepository.findAllByUsername(username);
            userResults.setPlayedGames(userResults.getPlayedGames() + 1);
            userResults.setCorrectPercent(newCorrectPercent);
            userResults.setWins(userResults.getWins() + 1);
        }
        if(winOrLose.equals("lost")){
            UserResults userResults = userResultsRepository.findAllByUsername(username);
            userResults.setPlayedGames(userResults.getPlayedGames() + 1);
            userResults.setCorrectPercent(newCorrectPercent);
        }
    }
}
