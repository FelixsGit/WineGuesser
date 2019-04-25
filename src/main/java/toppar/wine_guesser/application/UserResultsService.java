package toppar.wine_guesser.application;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.UserResultsRepository;

import java.text.DecimalFormat;
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

    public ProfileData getProfileDataForUserWithUsername(String username) throws UserException {
        if(userResultsRepository.findAllByUsername(username) == null){
            throw new UserException("profile not found");
        }
        UserResultsDTO userResultsDTO = userResultsRepository.findAllByUsername(username);
        List<MatchHistory> matchHistoryList = matchHistoryService.findAllByUserResultsId(userResultsDTO.getUserResultsId());
        return new ProfileData(userResultsDTO, matchHistoryList, username);
    }

    public void updateUserResultsByUser(String username, double numWinesGuessed, double numWinesCorrect){
        DecimalFormat numberFormat = new DecimalFormat("#.00");
        UserResults userResults = userResultsRepository.findAllByUsername(username);
        userResults.setPlayedGames(userResults.getPlayedGames() + 1);
        userResults.setNumWinesCorrect(userResults.getNumWinesCorrect() + numWinesCorrect);
        userResults.setNumWinesGuessed(userResults.getNumWinesGuessed() + numWinesGuessed);
        userResults.setCorrectPercent(Double.valueOf(numberFormat.format(userResults.getNumWinesCorrect()/userResults.getNumWinesGuessed())));
        userResultsRepository.save(userResults);
    }

    public void updateNumWinsForUser(String username){
        UserResults userResults = userResultsRepository.findAllByUsername(username);
        userResults.setWins(userResults.getWins() + 1);
        userResultsRepository.save(userResults);

    }
}
