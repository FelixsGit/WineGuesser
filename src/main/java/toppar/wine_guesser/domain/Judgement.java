package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "judgement", schema = "public")
public class Judgement implements JudgementDTO{


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "judgement_id")
    private int judgementId;
    private String username;
    private int servingOrder;
    private int personalGrade;
    private String gameId;

    protected Judgement(){

    }

    public Judgement(String username, int servingOrder, int personalGrade, String gameId) {
        this.username = username;
        this.servingOrder = servingOrder;
        this.personalGrade = personalGrade;
        this.gameId = gameId;
    }

    public int getJudgementId() {
        return judgementId;
    }

    public void setJudgementId(int judgementId) {
        this.judgementId = judgementId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getServingOrder() {
        return servingOrder;
    }

    public void setServingOrder(int servingOrder) {
        this.servingOrder = servingOrder;
    }

    public int getPersonalGrade() {
        return personalGrade;
    }

    public void setPersonalGrade(int personalGrade) {
        this.personalGrade = personalGrade;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }
}
