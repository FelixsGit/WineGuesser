package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.GameSetup;
import toppar.wine_guesser.domain.GameSetupDTO;
import toppar.wine_guesser.repository.GameSetupRepository;

import java.util.Random;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class GameSetupService{

    @Autowired
    private GameSetupRepository gameSetupRepository;

    public void createGameSetup(String numberOfWines, String gameHost){
        Random r = new Random();
        int gameId = r.nextInt(999999-100000) + 100000;
        deleteGameSetupByGameHost(gameHost);
        gameSetupRepository.save(new GameSetup(gameHost, numberOfWines, Integer.toString(gameId)));
    }

    public GameSetupDTO getGameSetupByGameHost(String gameHost){
        return gameSetupRepository.findByGameHost(gameHost);
    }

    private void deleteGameSetupByGameHost(String gameHost){
        gameSetupRepository.removeAllByGameHost(gameHost);
    }

    public void removeGameSetupByGameHost(String gameHost){
        gameSetupRepository.removeAllByGameHost(gameHost);
    }

}
