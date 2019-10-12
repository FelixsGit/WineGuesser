package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.GamePoint;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface GamePointRepository extends JpaRepository<GamePoint, String> {

    List<GamePoint> findAllBygameResult_id(int gameResult_id);

    GamePoint findAllBygameResult_idAndUsername(int gameResult_id, String username);
}
