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
import toppar.wine_guesser.repository.ClubMemberRepository;

import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class ClubMemberService {

    @Autowired
    private ClubMemberRepository clubMemberRepository;
    @Autowired
    private ClubService clubService;

    public boolean checkIfUserIsMemberInAClub(String username){
        return !clubMemberRepository.findAllByUsername(username).isEmpty();
    }

    public void joinClub(String clubName, String clubPassword, String username) throws ClubException {
        ClubDTO club = clubService.findClubByClubName(clubName);
        if(club != null){
            if(club.getClubPassword().equals(clubPassword)){
                if(clubMemberRepository.findAllByClubIdAndUsername(club.getClubId(), username) == null){
                    clubMemberRepository.save(new ClubMember(club.getClubId(), username));
                }else{
                    throw new ClubException("already a member of club");
                }
            }else{
                throw new ClubException("wrong clubpassword");
            }
        }else{
            throw new ClubException("wrong clubname");
        }
    }

    public List<ClubMember> findAllClubMembersByUsername(String username) {
        return clubMemberRepository.findAllByUsername(username);
    }

    public boolean checkIfUserIsMemberOfClubWithClubId(int clubId, String username) {
        if(clubMemberRepository.findAllByClubIdAndUsername(clubId, username) != null){
            return true;
        }
        return false;
    }

    public List<String> findAllUsersByClubId(int clubId) {
        List<String> clubMembers = new ArrayList<>();
        List<ClubMember> clubMemberList = clubMemberRepository.findAllByClubId(clubId);
        clubMemberList.forEach(clubMember -> clubMembers.add(clubMember.getUsername()));
        return clubMembers;
    }
}
