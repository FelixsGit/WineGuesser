package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.Club;
import toppar.wine_guesser.domain.ClubDTO;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface ClubRepository extends JpaRepository<Club, String> {


    Club findAllByClubName(String clubName);

    ClubDTO findByclub_id(int club_id);

    Club findAllByclub_id(int club_id);
}
