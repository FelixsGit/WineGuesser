package toppar.wine_guesser.application;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.ClubMemberRepository;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class ClubMemberService {

    @Autowired
    private ClubMemberRepository clubMemberRepository;
    @Autowired
    private ClubService clubService;
    @Autowired
    private GamePointService gamePointService;
    @Autowired
    private GameResultService gameResultService;

    public boolean checkIfUserIsMemberInAClub(String username){
        return !clubMemberRepository.findAllByUsername(username).isEmpty();
    }

    public void joinClub(String clubName, String clubPassword, String username) throws ClubException {
        ClubDTO club = clubService.findClubByClubName(clubName);
        if(club != null){
            if(club.getClubPassword().equals(clubPassword)){
                if(clubMemberRepository.findAllByClub_idAndUsername(club.getClub_id(), username) == null){
                    //update club stats
                    //clubService.updateClubOnJoin(club.getClubName(), username);
                    clubMemberRepository.save(new ClubMember(club.getClub_id(), username, "false"));
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
        if(clubMemberRepository.findAllByClub_idAndUsername(clubId, username) != null){
            return true;
        }
        return false;
    }

    public List<ClubMemberDTO> findAllUsersByClubId(int clubId) {
        List<ClubMember> clubMemberList = clubMemberRepository.findAllByClub_id(clubId);
        return new ArrayList<>(clubMemberList);
    }

    public void removeUserFromClub(int clubId, String username) {
        //clubService.updateClubOnLeave(clubId, username);
        clubMemberRepository.removeAllByUsernameAndClub_id(username, clubId);
    }

    public void updateForClubMember(String clubName, String gameId) throws ClubException {
        ClubDTO club = clubService.findClubByClubName(clubName);
        GameResult gameResult = gameResultService.getGameResultByGameId(gameId);
        List<GamePointDTO> gamePoints = gamePointService.getAllByGameResultId(gameResult.getGameResult_id());
        gamePoints.sort(Comparator.comparing(GamePointDTO::getPoints).reversed());
        List<ClubMember> clubMembers = clubMemberRepository.findAllByClub_id(club.getClub_id());

        //Sets all clubMembers to not be Bacchus
        for(int i = 0; i < clubMembers.size(); i++){
            clubMembers.get(i).setIsBacchus("false");
            clubMemberRepository.save(clubMembers.get(i));
        }

        //Calculate who is the new Bacchus
        int highest = 0;
        for(int i = 0; i < gamePoints.size(); i++){
            String currentUser = gamePoints.get(i).getUsername();
            if(highest < gamePoints.get(i).getPoints()){
                highest = gamePoints.get(i).getPoints();
            }
            if(gamePoints.get(i).getPoints() >= highest){
                ClubMember clubMember = clubMemberRepository.findAllByClub_idAndUsername(club.getClub_id(), currentUser);
                clubMember.setIsBacchus("true");
                clubMemberRepository.save(clubMember);
            }else{
                ClubMember clubMember = clubMemberRepository.findAllByClub_idAndUsername(club.getClub_id(), currentUser);
                clubMember.setIsBacchus("false");
                clubMemberRepository.save(clubMember);
            }
        }
    }
}
