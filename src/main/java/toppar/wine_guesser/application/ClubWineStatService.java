package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.ClubWineStatDTO;
import toppar.wine_guesser.repository.ClubWineStatRepository;

import java.util.Comparator;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class ClubWineStatService {

    @Autowired
    private ClubWineStatRepository clubWineStatRepository;


    public List<ClubWineStatDTO> findAllByClubId(int clubId) {
        List<ClubWineStatDTO> clubWineStatDTOS = clubWineStatRepository.findAllByClubId(clubId);
        clubWineStatDTOS.sort(Comparator.comparing(ClubWineStatDTO::getAverageGrade).reversed());
        return clubWineStatDTOS;
    }
}
