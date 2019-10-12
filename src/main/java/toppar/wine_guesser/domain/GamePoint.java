package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "`game_point`", schema = "public")
public class GamePoint implements GamePointDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int gamePointId;
    private int gameResultId;
    private String username;
    private int points;
    private int pointsNoRegion;

    protected GamePoint(){

    }

    public GamePoint(int gameResultId, String username, int points, int pointsNoRegion) {
        this.gameResultId = gameResultId;
        this.username = username;
        this.points = points;
        this.pointsNoRegion = pointsNoRegion;
    }

    public int getPointsNoRegion() {
        return pointsNoRegion;
    }

    public void setPointsNoRegion(int pointsNoRegion) {
        this.pointsNoRegion = pointsNoRegion;
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
