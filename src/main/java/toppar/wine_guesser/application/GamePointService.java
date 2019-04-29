package toppar.wine_guesser.application;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.GamePoint;
import toppar.wine_guesser.domain.GamePointDTO;
import toppar.wine_guesser.repository.GamePointRepository;

import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class GamePointService {

    @Autowired
    private GamePointRepository gamePointRepository;

    public void createNew(GamePoint gamePoint){
        gamePointRepository.save(gamePoint);
    }

    public List<GamePointDTO> getAllByGameResultId(int gameResultId){
        List<GamePoint> gamePointList = gamePointRepository.findAllByGameResultId(gameResultId);
        return new ArrayList<>(gamePointList);
    }

    public GamePoint getAllByGameResultIdAndUsername(int gameResultId, String username) {
        return gamePointRepository.findAllByGameResultIdAndUsername(gameResultId, username);
    }
}
