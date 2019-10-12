package toppar.wine_guesser.application;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.LobbyData;
import toppar.wine_guesser.domain.LobbyHistory;
import toppar.wine_guesser.repository.LobbyHistoryRepository;

import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class LobbyHistoryService {

    @Autowired
    private LobbyHistoryRepository lobbyHistoryRepository;

    void saveLobbyData(List<LobbyData> lobbyDataList){
        lobbyDataList.forEach(lobbyData ->
            lobbyHistoryRepository.save(new LobbyHistory(lobbyData.getLobby_id(), lobbyData.getGameHost(), lobbyData.getGame_id(), lobbyData.getParticipants(),
                    lobbyData.getScore(), lobbyData.getReady(), lobbyData.getDone())));
    }
}
