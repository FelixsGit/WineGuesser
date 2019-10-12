package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.LobbyData;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface LobbyDataRepository extends JpaRepository<LobbyData, String> {

    @Override
    LobbyData save(LobbyData lobbyData);

    List<LobbyData> findAllByGameHost(String gameHost);

    LobbyData findByParticipants(String participant);

    void removeByParticipants(String participant);

    void removeAllByGame_id(String game_id);

    List<LobbyData> findAllByGame_id(String game_id);
}
