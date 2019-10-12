package toppar.wine_guesser.domain;

import javax.persistence.*;


@Entity
@Table(name = "user_results")
public class UserResults implements UserResultsDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userResultsId;
    private String username;
    private int playedGames;
    private double numWinesGuessed;
    private double numWinesCorrect;
    private int wins;
    private double correctPercent;
    private String isBacchus;

    protected UserResults(){

    }

    public UserResults(String username, int playedGames, double numWinesGuessed, double numWinesCorrect, int wins, double correctPercent, String isBacchus) {
        this.username = username;
        this.playedGames = playedGames;
        this.numWinesGuessed = numWinesGuessed;
        this.numWinesCorrect = numWinesCorrect;
        this.wins = wins;
        this.correctPercent = correctPercent;
        this.isBacchus = isBacchus;

    }

    public String getIsBacchus() {
        return isBacchus;
    }

    public void setIsBacchus(String isBacchus) {
        this.isBacchus = isBacchus;
    }

    public int getUserResultsId() {
        return userResultsId;
    }

    public void setUserResultsId(int userResultsId) {
        this.userResultsId = userResultsId;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPlayedGames() {
        return playedGames;
    }

    public void setPlayedGames(int playedGames) {
        this.playedGames = playedGames;
    }

    public double getNumWinesGuessed() {
        return numWinesGuessed;
    }

    public void setNumWinesGuessed(double numWinesGuessed) {
        this.numWinesGuessed = numWinesGuessed;
    }

    public double getNumWinesCorrect() {
        return numWinesCorrect;
    }

    public void setNumWinesCorrect(double numWinesCorrect) {
        this.numWinesCorrect = numWinesCorrect;
    }

    public int getWins() {
        return wins;
    }

    public void setWins(int wins) {
        this.wins = wins;
    }

    public double getCorrectPercent() {
        return correctPercent;
    }

    public void setCorrectPercent(double correctPercent) {
        this.correctPercent = correctPercent;
    }
}
