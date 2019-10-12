package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "`game_point`", schema = "public")
public class GamePoint implements GamePointDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int gamePoint_id;
    private int gameResult_id;
    private String username;
    private int points;
    private int pointsNoRegion;

    protected GamePoint(){

    }

    public GamePoint(int gameResultId, String username, int points, int pointsNoRegion) {
        this.gameResult_id = gameResultId;
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

    public int getGamePoint_id() {
        return gamePoint_id;
    }

    public void setGamePoint_id(int gamePoint_id) {
        this.gamePoint_id = gamePoint_id;
    }

    public int getGameResult_id() {
        return gameResult_id;
    }

    public void setGameResult_id(int gameResult_id) {
        this.gameResult_id = gameResult_id;
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
