package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.Judgement;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface JudgementRepository extends JpaRepository<Judgement, Integer> {

    List<Judgement> findAllByUsernameAndGameId(String username, String gameId);

    Judgement findAllByUsernameAndGameIdAndServingOrder(String username, String gameId, int servingOrder);

    List<Judgement> findAllByServingOrderAndGameId(int servingOrder, String gameId);

    void removeAllByGameId(String gameId);

    void removeAllByUsernameAndGameId(String username, String gameId);
}
