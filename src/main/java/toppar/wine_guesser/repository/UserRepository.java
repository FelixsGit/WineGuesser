package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.User;
import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface UserRepository extends JpaRepository<User, String> {

    User findUserByUsername(String username);

    @Override
    List<User> findAll();

    @Override
    User save(User user);

    List<User> findAllByActiveGame(String activeGame);
}
