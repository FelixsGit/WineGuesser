package toppar.wine_guesser.domain;


import javax.persistence.*;

import javax.persistence.*;

@Entity
@Table(name = "game_result")
public class GameResult implements GameResultDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int gameResultId;
    private String gameId;
    private String url;
    private String comment;

    protected GameResult(){

    }

    public GameResult(String gameId, String url, String comment) {
        this.gameId = gameId;
        this.url = url;
        this.comment = comment;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getGameResultId() {
        return gameResultId;
    }

    public void setGameResultId(int gameResultId) {
        this.gameResultId = gameResultId;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}