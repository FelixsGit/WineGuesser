package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.ClubMember;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface ClubMemberRepository extends JpaRepository<ClubMember, String> {


    List<ClubMember> findAllByUsername(String username);

    ClubMember findAllByClubIdAndUsername(int clubId, String username);

    List<ClubMember> findAllByClubId(int clubId);

    void removeAllByUsernameAndClubId(String username, int clubId);
}
