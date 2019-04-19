package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.MatchHistory;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface MatchHistoryRepository extends JpaRepository<MatchHistory, String> {

    List<MatchHistory> findAllByGameId(String gameId);

}
