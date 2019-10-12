package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.LobbyRepository;

import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class LobbyService {

    @Autowired
    private LobbyRepository lobbyRepository;
    @Autowired
    private GameSetupService gameSetupService;
    @Autowired
    private ClubMemberService clubMemberService;
    @Autowired
    private ClubService clubService;

    public void createGameLobby(String gameId){
        lobbyRepository.save(new Lobby(gameId, "prestart"));
    }

    public Lobby getLobbyByGameId(String gameId){
        return lobbyRepository.findLobbyByGameId(gameId);
    }

    public void checkAuthorizationByGameId(String gameId, String username) throws AuthorizationException, ClubException {
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
        if(lobby == null || lobby.getGameStart().equals("canceled") || lobby.getGameStart().equals("started")) {
            throw new AuthorizationException("Wrong Lobby Code");
        }
        checkIfUserIsMemberInCorrectClub(username, gameId);
    }

    private void checkIfUserIsMemberInCorrectClub(String username, String gameId) throws ClubException, AuthorizationException {
        GameSetup gameSetup = gameSetupService.getGameSetupByGameId(gameId);
        if(gameSetup.getClubName() != null){
            String validClubName = gameSetup.getClubName();
            ClubDTO clubDTO = clubService.findClubByClubName(validClubName);
            List<ClubMember> clubMembers = clubMemberService.findAllClubMembersByUsername(username);
            if(clubMembers.isEmpty()){
                throw new AuthorizationException("missing club");
            }
            boolean inCorrectClub = false;
            for(int i = 0; i < clubMembers.size(); i++){
                if(clubMembers.get(i).getClubId() == clubDTO.getClubId()){
                    inCorrectClub = true;
                }
            }
            if(!inCorrectClub){
                throw new AuthorizationException("missing club");
            }
        }
    }

    public String getGameStartByGameId(String gameId){
        return lobbyRepository.findLobbyByGameId(gameId).getGameStart();
    }

    public void cancelGameLobbyByGameId(String gameId){
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
        lobby.setGameStart("canceled");
        lobbyRepository.save(lobby);
    }

    public void startGameLobbyByGameId(String gameId){
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
        if(lobby != null){
            if(lobby.getGameStart().equals("prestart")){
                lobby.setGameStart("started");
                lobbyRepository.save(lobby);
            }
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

    public void setGameStartToGuessLocked(String gameId){
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
    }


    public void setGameStartToCompleted(String gameId){
        Lobby lobby = lobbyRepository.findLobbyByGameId(gameId);
        lobby.setGameStart("completed");
        lobbyRepository.save(lobby);
    }
}
