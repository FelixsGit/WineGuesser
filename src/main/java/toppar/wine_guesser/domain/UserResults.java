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
    private int wins;
    private double correctPercent;

    protected UserResults(){

    }


    public UserResults(String username, int playedGames, int wins, double correctPercent) {
        this.username = username;
        this.playedGames = playedGames;
        this.wins = wins;
        this.correctPercent = correctPercent;
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
