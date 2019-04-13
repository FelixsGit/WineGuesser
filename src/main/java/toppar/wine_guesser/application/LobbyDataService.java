package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.Lobby;
import toppar.wine_guesser.domain.LobbyData;
import toppar.wine_guesser.domain.LobbyHistory;
import toppar.wine_guesser.repository.LobbyDataRepository;

import java.util.Collections;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class LobbyDataService {

    @Autowired
    private LobbyDataRepository lobbyDataRepository;
    @Autowired
    private LobbyService lobbyService;
    @Autowired
    private LobbyHistoryService lobbyHistoryService;


    public void openNewLobby(String gameHost, String gameId){
        lobbyService.createGameLobby(gameId);
        Lobby lobby = lobbyService.getLobbyByGameId(gameId);
        lobbyDataRepository.save(new LobbyData(lobby.getLobbyId(), gameHost, gameId, gameHost, 0, 0, 0));
    }

    public void addParticipant(String participant, String gameId){
        Lobby lobby = lobbyService.getLobbyByGameId(gameId);
        lobbyDataRepository.save(new LobbyData(lobby.getLobbyId(), null, gameId, participant, 0, 0, 0));
    }

    public boolean isGameHost(String username){
         List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameHost(username);
         if(lobbyDataList.isEmpty()){
             return false;
         }
         return true;
    }

    public void removeAllParticipantsFromLobbyWithGameId(String gameId){
        List<LobbyData> lobbyDataList= lobbyDataRepository.findAllByGameId(gameId);
        lobbyHistoryService.saveLobbyData(lobbyDataList);
        lobbyDataRepository.removeAllByGameId(gameId);
    }

    public void removeParticipantFromLobby(String participant){
        lobbyHistoryService.saveLobbyData(Collections.singletonList(lobbyDataRepository.findByParticipants(participant)));
        lobbyDataRepository.removeByParticipants(participant);
    }


}
