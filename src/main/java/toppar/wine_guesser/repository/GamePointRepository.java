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

    List<GamePoint> findAllByGameResultId(int gameResultId);

    GamePoint findAllByGameResultIdAndUsername(int gameResultId, String username);
}
