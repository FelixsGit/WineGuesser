package toppar.wine_guesser.application;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.Judgement;
import toppar.wine_guesser.domain.JudgementException;
import toppar.wine_guesser.repository.JudgementRepository;

import java.text.DecimalFormat;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class JudgementService {

    @Autowired
    private JudgementRepository judgementRepository;

    public void saveJudgement(int servingWineNum, int personalGrade, String gameId, String username) throws JudgementException {
        checkForValidJudgment(personalGrade);
        judgementRepository.save(new Judgement(username, servingWineNum, personalGrade, gameId));
    }

    private void checkForValidJudgment(int grade) throws JudgementException {
        try {
            if (grade < 1 || grade > 5) {
                throw new JudgementException("judgement range error");
            }
        }catch(NumberFormatException e){
            throw new JudgementException("not a number");
        }
    }

    public void removeAllByGameId(String gameId){
        judgementRepository.removeAllByGameId(gameId);
    }

    public int findNumberOfJudgementsForUserAndGame(String username, String gameId){
        return judgementRepository.findAllByUsernameAndGameId(username, gameId).size();
    }

    public int findPersonalGrade(String username, String gameId, int servingOrder){
        Judgement judgement =judgementRepository.findAllByUsernameAndGameIdAndServingOrder(username, gameId, servingOrder);
        return judgement.getPersonalGrade();
    }

    public double findAverageGradeByServingOrderAndGameId(int servingOrder, String gameId){
        List<Judgement> judgementList = judgementRepository.findAllByServingOrderAndGameId(servingOrder, gameId);
        double numberOfUsers = judgementList.size();
        double totalAddedGrades = 0;
        for(int i = 0; i < judgementList.size(); i++){
            totalAddedGrades += judgementList.get(i).getPersonalGrade();
        }
        DecimalFormat numberFormat = new DecimalFormat("#.0");
        String amountToReturn = numberFormat.format(totalAddedGrades/numberOfUsers);
        return Double.valueOf(amountToReturn);
    }

    public void removeByUsernameAndGameId(String username, String gameId) {
        judgementRepository.removeAllByUsernameAndGameId(username, gameId);
    }
}
