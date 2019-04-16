package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "game_point")
public class GamePoint implements GamePointDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int gamePointId;
    private int gameResultId;
    private String username;
    private int points;

    protected GamePoint(){

    }

    public GamePoint(int gameResultId, String username, int points) {
        this.gameResultId = gameResultId;
        this.username = username;
        this.points = points;
    }

    public int getGamePointId() {
        return gamePointId;
    }

    public void setGamePointId(int gamePointId) {
        this.gamePointId = gamePointId;
    }

    public int getGameResultId() {
        return gameResultId;
    }

    public void setGameResultId(int gameResultId) {
        this.gameResultId = gameResultId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
}
