package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.AuthorizationException;
import toppar.wine_guesser.domain.Lobby;
import toppar.wine_guesser.repository.LobbyRepository;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class LobbyService {

    @Autowired
    private LobbyRepository lobbyRepository;

    public void createGameLobby(String gameId){
        lobbyRepository.save(new Lobby(gameId, "prestart"));
    }

    public Lobby getLobbyByGameId(String gameId){
        return lobbyRepository.findLobbyByGameId(gameId);
    }

    public void checkAuthorizationByGameId(String gameId) throws AuthorizationException {
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
        if(lobby == null || lobby.getGameStart().equals("canceled") || lobby.getGameStart().equals("started")) {
            throw new AuthorizationException("Wrong Lobby Code");
        }
    }

    public void cancelGameLobbyByGameId(String gameId){
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
        lobby.setGameStart("canceled");
        lobbyRepository.save(lobby);
    }

    public void startGameLobbyByGameId(String gameId){
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
        if(lobby.getGameStart().equals("prestart")){
            lobby.setGameStart("started");
            lobbyRepository.save(lobby);
        }
    }

    public boolean checkIfGameHasStarted(String gameId){
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
        if(lobby.getGameStart().equals("started")){
           return true;
        }
        return false;
    }

    public void setGameStartToFinished(String gameId){
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
        lobby.setGameStart("finished");
        lobbyRepository.save(lobby);
    }
}
