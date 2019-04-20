package toppar.wine_guesser.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import toppar.wine_guesser.domain.UserGuesses;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface UserGuessesRepository extends JpaRepository<UserGuesses, String> {

    List<UserGuesses> findAllByUsername(String username);

    List<UserGuesses> findAllByGameIdAndUsername(String gameId, String username);

    List<UserGuesses> findAllByUsernameAndServingOrderGuess(String username, int servingOrderGuess);

    void removeAllByGameId(String gameId);

}
