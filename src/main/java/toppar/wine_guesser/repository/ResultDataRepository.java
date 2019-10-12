package toppar.wine_guesser.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.ResultData;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface ResultDataRepository extends JpaRepository<ResultData, String> {

    List<ResultData> findAllByUsernameAndGameResultId(String username, int gameResult_id);

    List<ResultData> findAllByGameResultIdAndUsername(int gameResult_id, String username);
}
