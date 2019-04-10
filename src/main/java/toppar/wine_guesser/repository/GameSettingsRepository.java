package toppar.wine_guesser.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.GameSettings;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface GameSettingsRepository extends JpaRepository<GameSettings, String> {

    @Override
    GameSettings save(GameSettings gameSettings);

    List<GameSettings> findAllByGameId(String gameId);

    void removeAllByGameId(String gameId);

}
