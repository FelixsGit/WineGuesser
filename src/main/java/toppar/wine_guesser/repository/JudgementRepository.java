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

    List<Judgement> findAllByUsernameAndGame_id(String username, String game_id);

    Judgement findAllByUsernameAndGame_idAndServingOrder(String username, String game_id, int servingOrder);

    List<Judgement> findAllByServingOrderAndGame_id(int servingOrder, String game_id);

    void removeAllByGame_id(String game_id);

    void removeAllByUsernameAndGame_id(String username, String game_id);
}
