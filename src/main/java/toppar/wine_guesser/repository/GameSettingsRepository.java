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

    List<GameSettings> findAllByGameId(String game_id);

    List<GameSettings> findAllByUrl(String url);

    List<GameSettings> findAllByGameHost(String gameHost);

    void removeAllByGameHost(String gameHost);

    List<GameSettings> findAll();

    GameSettings findAllByGameIdAndServingOrder(String game_id, String servingOrder);

}
