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

    ClubMember findAllByClub_idAndUsername(int club_id, String username);

    List<ClubMember> findAllByClub_id(int club_id);

    void removeAllByUsernameAndClub_id(String username, int club_id);
}
