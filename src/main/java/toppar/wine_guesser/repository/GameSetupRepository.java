package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.GameSetup;

    @Repository
    @Transactional(propagation = Propagation.MANDATORY)
    public interface GameSetupRepository extends JpaRepository<GameSetup, Integer> {

        @Override
        GameSetup save(GameSetup gameSetup);

    GameSetup findByGameHost(String gameHost);

    void removeAllByGameHost(String gameHost);

    void removeByGameHost(String gameHost);

    GameSetup findAllByGame_id(String game_id);
    }
