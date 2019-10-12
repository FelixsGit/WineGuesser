package toppar.wine_guesser.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.Lobby;
import toppar.wine_guesser.domain.LobbyData;
import toppar.wine_guesser.domain.User;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface LobbyRepository extends JpaRepository<Lobby, String> {

    @Override
    Lobby save(Lobby lobby);

    long findLobbyIdByGameId(String game_id);

    String findGameStartByGameId(String game_id);

    Lobby findLobbyByGameId(String game_id);

}
