package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.UserResults;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface UserResultsRepository extends JpaRepository<UserResults, String> {

    UserResults findAllByUsername(String username);
}
