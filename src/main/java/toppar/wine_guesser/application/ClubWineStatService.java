package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.ClubWineStatRepository;

import java.text.DecimalFormat;
import java.util.Comparator;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class ClubWineStatService {

    @Autowired
    private ClubWineStatRepository clubWineStatRepository;
    @Autowired
    private GameResultService gameResultService;
    @Autowired
    private ResultDataService resultDataService;
    @Autowired
    private ClubService clubService;


    public List<ClubWineStatDTO> findAllByClubId(int clubId) {
        List<ClubWineStatDTO> clubWineStatDTOS = clubWineStatRepository.findAllByclub_id(clubId);
        clubWineStatDTOS.sort(Comparator.comparing(ClubWineStatDTO::getAverageGrade).reversed());
        return clubWineStatDTOS;
    }

    public void updateForClubWineStat(String clubName, String gameId, String username) throws ClubException {
        ClubDTO clubDTO = clubService.findClubByClubName(clubName);
        GameResult gameResult = gameResultService.getGameResultByGameId(gameId);
        List<ResultDataDTO> resultDataList = resultDataService.getAllByGameResultIdAndUsername(gameResult.getGameResult_id(), username);

        for(int i = 0; i < resultDataList.size(); i++){
            ClubWineStat clubWineStat = clubWineStatRepository.findAllByclub_idAndWineName(clubDTO.getClub_id(), resultDataList.get(i).getWineName());
            if(clubWineStat != null){
                //wine already had on a previous tasting
                clubWineStat.setNumberOfServings(clubWineStat.getNumberOfServings() + 1);
                double oldGrade = clubWineStat.getAverageGrade();
                double newGrade = resultDataList.get(i).getAverageGrade();
                double numberOfServings = clubWineStat.getNumberOfServings();
                DecimalFormat numberFormat = new DecimalFormat("#.00");
                clubWineStat.setAverageGrade(Double.valueOf(numberFormat.format(oldGrade - ((oldGrade - newGrade) / numberOfServings))));
                clubWineStatRepository.save(clubWineStat);
            }else{
                //tasting wine for first time
                clubWineStatRepository.save(new ClubWineStat(clubDTO.getClub_id(), resultDataList.get(i).getWineName(), resultDataList.get(i).getUrl(),
                        1, resultDataList.get(i).getAverageGrade()));
            }
        }
    }
}
