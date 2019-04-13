package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.LobbyHistory;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface LobbyHistoryRepository extends JpaRepository<LobbyHistory, String> {

    @Override
    LobbyHistory save(LobbyHistory lobbyHistory);

}