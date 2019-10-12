package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.AuthorizationException;
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
        gameSetupRepository.save(new GameSetup(gameHost, numberOfWines, Integer.toString(gameId), null, null));
    }

    public GameSetupDTO getGameSetupByGameHost(String gameHost) throws AuthorizationException {
        GameSetupDTO gameSetupDTO = gameSetupRepository.findByGameHost(gameHost);
        if(gameSetupDTO == null){
            throw new AuthorizationException("no gameSetup found");
        }
        return gameSetupDTO;
    }

    private void deleteGameSetupByGameHost(String gameHost){
        gameSetupRepository.removeAllByGameHost(gameHost);
    }

    public void removeGameSetupByGameHost(String gameHost){
        gameSetupRepository.removeAllByGameHost(gameHost);
    }

    public GameSetup getGameSetupByGameId(String gameId){
        return gameSetupRepository.findAllByGameId(gameId);
    }

    public void updateGameSetupWithChosenClub(String gameHost, String clubName) {
        GameSetup gameSetup = gameSetupRepository.findByGameHost(gameHost);
        gameSetup.setClubName(clubName);
        gameSetupRepository.save(gameSetup);
    }

    public void setCommentForGameSetupWithGameId(String comment, String gameId) {
        GameSetup gameSetup = gameSetupRepository.findAllByGameId(gameId);
        gameSetup.setComment(comment);
        gameSetupRepository.save(gameSetup);
    }
}
