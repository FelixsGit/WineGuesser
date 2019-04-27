package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.Club;
import toppar.wine_guesser.domain.ClubDTO;
import toppar.wine_guesser.domain.ClubException;
import toppar.wine_guesser.domain.ClubMember;
import toppar.wine_guesser.repository.ClubRepository;

import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class ClubService {

    @Autowired
    private ClubRepository clubRepository;
    @Autowired
    private ClubMemberService clubMemberService;

    public void createNewClub(String clubName, String clubPassword, String clubCreator) throws ClubException {
        if(clubRepository.findAllByClubName(clubName) == null){
            clubRepository.save(new Club(clubName, clubPassword, 0, 0, clubCreator));
        }else{
            throw new ClubException("clubname taken");
        }
    }

    public ClubDTO findClubByClubName(String clubName) throws ClubException {
        if(clubRepository.findAllByClubName(clubName) != null){
            return clubRepository.findAllByClubName(clubName);
        }else{
            throw new ClubException("WRONG CLUBNAME");
        }
    }

    public List<ClubDTO> findAllClubsByUsername(String username) throws ClubException {
        List<ClubDTO> clubDTOS = new ArrayList<>();
        List<ClubMember> clubMembers = clubMemberService.findAllClubMembersByUsername(username);
        if(clubMembers.isEmpty()){
            throw new ClubException("your not a member of any club");
        }
        for (ClubMember clubMember : clubMembers) {
            clubDTOS.add(clubRepository.findByClubId(clubMember.getClubId()));
        }
        return clubDTOS;
    }

    public List<ClubDTO> getAllClubsByUsername(String username){
        List<ClubDTO> clubDTOS = new ArrayList<>();
        List<ClubMember> clubMembers = clubMemberService.findAllClubMembersByUsername(username);
        for (ClubMember clubMember : clubMembers) {
            clubDTOS.add(clubRepository.findByClubId(clubMember.getClubId()));
        }
        return clubDTOS;
    }
}
