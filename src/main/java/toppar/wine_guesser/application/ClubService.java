package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
    @Autowired
    private GameResultService gameResultService;
    @Autowired
    private GameSettingsService gameSettingsService;

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
            clubDTOS.add(clubRepository.findByClub_id(clubMember.getClub_id()));
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
            clubs.add((Club) clubRepository.findByClub_id(clubMember.getClub_id()));
        }
        return clubs;
    }

    public List<ClubDTO> getAllClubsByUsername(String username){
        List<ClubDTO> clubDTOS = new ArrayList<>();
        List<ClubMember> clubMembers = clubMemberService.findAllClubMembersByUsername(username);
        for (ClubMember clubMember : clubMembers) {
            clubDTOS.add(clubRepository.findByClub_id(clubMember.getClub_id()));
        }
        return clubDTOS;
    }

    public void updateClub(String clubName, String gameId) throws ClubException {
        Club club = clubRepository.findAllByClubName(clubName);
        List<String> clubMembers = lobbyDataService.getParticipantsByGameId(gameId);
        checkThatAllParticipantsAreClubMembers(club.getClub_id(), clubMembers);
        GameResult gameResult = gameResultService.getGameResultByGameId(gameId);
        double totalNumWinesCorrect = 0;
        double totalNumWinesGuessed = 0;
        double numberOfWines = gameSettingsService.getAllByGameId(gameId).size();
        for(int i = 0; i < clubMembers.size(); i++){
            GamePoint gamePoint = gamePointService.getAllByGameResultIdAndUsername(gameResult.getGameResult_id(), clubMembers.get(i));
            totalNumWinesCorrect += gamePoint.getPointsNoRegion();
            totalNumWinesGuessed += numberOfWines;
        }
        double averageWineCorrect = (club.getNumWinesCorrect() + totalNumWinesCorrect)/(totalNumWinesGuessed + club.getNumWinesGuessed());
        DecimalFormat numberFormat = new DecimalFormat("#.00");
        club.setAverageWineCorrect(Double.valueOf(numberFormat.format(averageWineCorrect)));
        club.setNumWinesCorrect(club.getNumWinesCorrect() + totalNumWinesCorrect);
        club.setNumWinesGuessed(club.getNumWinesGuessed() + totalNumWinesGuessed);
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

    public void updateClubOnJoin(String clubName, String username) {
        UserResults userResults = userResultsService.findByUsername(username);
        if(userResults.getPlayedGames() > 0){
            Club clubToUpdate = clubRepository.findAllByClubName(clubName);
            double totalNumWinesCorrect = userResults.getNumWinesCorrect() + clubToUpdate.getNumWinesCorrect();
            double totalNumWinesGuessed = userResults.getNumWinesGuessed() + clubToUpdate.getNumWinesGuessed();
            double averageWineCorrect = totalNumWinesCorrect/totalNumWinesGuessed;
            DecimalFormat numberFormat = new DecimalFormat("#.00");
            clubToUpdate.setNumWinesGuessed(totalNumWinesGuessed);
            clubToUpdate.setNumWinesCorrect(totalNumWinesCorrect);
            clubToUpdate.setAverageWineCorrect(Double.valueOf(numberFormat.format(averageWineCorrect)));
            clubRepository.save(clubToUpdate);
        }
    }

    public void updateClubOnLeave(int clubId, String username) {
        UserResults userResults = userResultsService.findByUsername(username);
        if(userResults.getPlayedGames() > 0){
            Club clubToUpdate = clubRepository.findAllByClub_id(clubId);
            double totalNumWinesCorrect = clubToUpdate.getNumWinesCorrect() - userResults.getNumWinesCorrect();
            double totalNumWinesGuessed = clubToUpdate.getNumWinesGuessed() - userResults.getNumWinesGuessed();
            double averageWineCorrect = 0;
            if(totalNumWinesCorrect == 0.0 || totalNumWinesGuessed == 0.0){
                clubToUpdate.setNumWinesGuessed(totalNumWinesGuessed);
                clubToUpdate.setNumWinesCorrect(totalNumWinesCorrect);
                clubToUpdate.setAverageWineCorrect(averageWineCorrect);
                clubRepository.save(clubToUpdate);
                return;
            }else{
                DecimalFormat numberFormat = new DecimalFormat("#.00");
                averageWineCorrect = totalNumWinesCorrect / totalNumWinesGuessed;
                clubToUpdate.setNumWinesGuessed(totalNumWinesGuessed);
                clubToUpdate.setNumWinesCorrect(totalNumWinesCorrect);
                clubToUpdate.setAverageWineCorrect(Double.valueOf(numberFormat.format(averageWineCorrect)));
                clubRepository.save(clubToUpdate);
            }
        }
    }
}
