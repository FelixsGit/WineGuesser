package toppar.wine_guesser.application;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.UserResultsRepository;

import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class UserResultsService {

    @Autowired
    private UserResultsRepository userResultsRepository;
    @Autowired
    private MatchHistoryService matchHistoryService;

    public void create(UserResults userResults){
        userResultsRepository.save(userResults);
    }

    public UserResults findByUsername(String username){
        return userResultsRepository.findAllByUsername(username);
    }

    public ProfileData getProfileDataForUserWithUsername(String username){
        if(userResultsRepository.findAllByUsername(username) == null){
            /**
             * TODO Throw new exception if user could not be found
             */
        }
        UserResultsDTO userResultsDTO = userResultsRepository.findAllByUsername(username);
        List<MatchHistory> matchHistoryList = matchHistoryService.findAllByUserResultsId(userResultsDTO.getUserResultsId());
        return new ProfileData(userResultsDTO, matchHistoryList, username);
    }

    public void updateByUsername(String username, double newCorrectPercent, String winOrLose){
        if(winOrLose.equals("win")){
            UserResults userResults = userResultsRepository.findAllByUsername(username);
            userResults.setPlayedGames(userResults.getPlayedGames() + 1);
            userResults.setCorrectPercent(newCorrectPercent);
            userResults.setWins(userResults.getWins() + 1);
            userResultsRepository.save(userResults);
        }
        if(winOrLose.equals("lose")){
            UserResults userResults = userResultsRepository.findAllByUsername(username);
            userResults.setPlayedGames(userResults.getPlayedGames() + 1);
            userResults.setCorrectPercent(newCorrectPercent);
            userResultsRepository.save(userResults);
        }
    }
}
