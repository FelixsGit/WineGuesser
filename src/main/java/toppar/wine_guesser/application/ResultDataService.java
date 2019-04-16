package toppar.wine_guesser.application;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.ResultData;
import toppar.wine_guesser.domain.ResultDataDTO;
import toppar.wine_guesser.repository.ResultDataRepository;

import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class ResultDataService {

    @Autowired
    private ResultDataRepository resultDataRepository;

    public void createNew(ResultData resultData){
        resultDataRepository.save(resultData);
    }

    public List<ResultData> getAllByUsername(String username){
        return resultDataRepository.findAllByUsername(username);
    }

    public List<ResultDataDTO> getAllByGameResultIdAndUsername(int gameResult, String username){
        List<ResultData> resultDataList = resultDataRepository.findAllByGameResultIdAndUsername(gameResult, username);
        return new ArrayList<>(resultDataList);
    }

}
