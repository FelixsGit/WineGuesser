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

    List<Judgement> findAllByUsernameAndgame_id(String username, String game_id);

    Judgement findAllByUsernameAndgame_idAndServingOrder(String username, String game_id, int servingOrder);

    List<Judgement> findAllByServingOrderAndgame_id(int servingOrder, String game_id);

    void removeAllBygame_id(String game_id);

    void removeAllByUsernameAndgame_id(String username, String game_id);
}
