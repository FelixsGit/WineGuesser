package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.MatchHistory;
import toppar.wine_guesser.repository.MatchHistoryRepository;

import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class MatchHistoryService {

    @Autowired
    private MatchHistoryRepository matchHistoryRepository;

    public void create(MatchHistory matchHistory){
        matchHistoryRepository.save(matchHistory);
    }

    public boolean isOldGame(String gameId){
        if(matchHistoryRepository.findAllByGameId(gameId).isEmpty()){
            return false;
        }
        return true;
    }

    public List<MatchHistory> findAllByUserResultsId(int userResultsId){
        List<MatchHistory> matchHistoryList = matchHistoryRepository.findAllByUserResultsId(userResultsId);
        return matchHistoryList;
    }
}
