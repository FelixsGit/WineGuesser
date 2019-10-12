package toppar.wine_guesser.domain;


import javax.persistence.*;

@Entity
@Table(name = "`game_result`", schema = "public")
public class GameResult implements GameResultDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int gameResult_id;
    private String game_id;
    private String url;
    private String comment;

    protected GameResult(){

    }

    public GameResult(String gameId, String url, String comment) {
        this.game_id = gameId;
        this.url = url;
        this.comment = comment;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getGameResult_id() {
        return gameResult_id;
    }

    public void setGameResult_id(int gameResult_id) {
        this.gameResult_id = gameResult_id;
    }

    public String getGame_id() {
        return game_id;
    }

    public void setGame_id(String game_id) {
        this.game_id = game_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}