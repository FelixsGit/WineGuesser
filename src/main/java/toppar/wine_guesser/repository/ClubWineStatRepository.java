package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.ClubWineStat;
import toppar.wine_guesser.domain.ClubWineStatDTO;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface ClubWineStatRepository extends JpaRepository<ClubWineStat, String> {


    List<ClubWineStatDTO> findAllByClubId(int club_id);

    ClubWineStat findAllByClubIdAndWineName(int club_id, String wineName);
}
