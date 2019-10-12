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

    List<ResultData> findAllByUsernameAndGameResult_id(String username, int gameResult_id);

    List<ResultData> findAllByGameResult_idAndUsername(int gameResult_id, String username);
}
