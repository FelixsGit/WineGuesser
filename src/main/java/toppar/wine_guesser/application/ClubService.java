package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.ClubRepository;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class ClubService {

    @Autowired
    private ClubRepository clubRepository;
    @Autowired
    private ClubMemberService clubMemberService;
    @Autowired
    private LobbyDataService lobbyDataService;
    @Autowired
    private UserResultsService userResultsService;
    @Autowired
    private GamePointService gamePointService;

    public void createNewClub(String clubName, String clubPassword, String clubCreator) throws ClubException {
        if(clubRepository.findAllByClubName(clubName) == null){
            clubRepository.save(new Club(clubName, clubPassword, 0, 0,0, 0, clubCreator));
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

    public List<ClubDTO> findAllClubDTOsByUsername(String username) throws ClubException {
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

    public List<Club> findAllClubsByUsername(String username) throws ClubException {
        List<Club> clubs = new ArrayList<>();
        List<ClubMember> clubMembers = clubMemberService.findAllClubMembersByUsername(username);
        if(clubMembers.isEmpty()){
            throw new ClubException("your not a member of any club");
        }
        for (ClubMember clubMember : clubMembers) {
            clubs.add((Club) clubRepository.findByClubId(clubMember.getClubId()));
        }
        return clubs;
    }

    public List<ClubDTO> getAllClubsByUsername(String username){
        List<ClubDTO> clubDTOS = new ArrayList<>();
        List<ClubMember> clubMembers = clubMemberService.findAllClubMembersByUsername(username);
        for (ClubMember clubMember : clubMembers) {
            clubDTOS.add(clubRepository.findByClubId(clubMember.getClubId()));
        }
        return clubDTOS;
    }

    public void updateClub(String clubName, String gameId) throws ClubException {
        Club club = clubRepository.findAllByClubName(clubName);
        List<String> clubMembers = lobbyDataService.getParticipantsByGameId(gameId);
        checkThatAllParticipantsAreClubMembers(club.getClubId(), clubMembers);
        double totalNumWinesCorrect = 0;
        double totalNumWinesGuessed = 0;
        for(int i = 0; i < clubMembers.size(); i++){
            UserResults userResults = userResultsService.findByUsername(clubMembers.get(i));
            totalNumWinesCorrect += userResults.getNumWinesCorrect();
            totalNumWinesGuessed += userResults.getNumWinesGuessed();
        }
        double averageWineCorrect = totalNumWinesCorrect/totalNumWinesGuessed;
        DecimalFormat numberFormat = new DecimalFormat("#.00");
        club.setAverageWineCorrect(Double.valueOf(numberFormat.format(averageWineCorrect)));
        club.setNumWinesCorrect(totalNumWinesCorrect);
        club.setNumWinesGuessed(totalNumWinesGuessed);
        club.setNumberOfTastings(club.getNumberOfTastings() + 1);
        clubRepository.save(club);
    }

    private void checkThatAllParticipantsAreClubMembers(int clubId, List<String> participants) throws ClubException {
        for(int i = 0; i < participants.size(); i++){
            if(!clubMemberService.checkIfUserIsMemberOfClubWithClubId(clubId, participants.get(i))){
                throw new ClubException("not all users are in the club");
            }
        }
    }
}
