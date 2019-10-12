package toppar.wine_guesser.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "`lobby`", schema = "public")
public class Lobby implements LobbyDTO {

    @Id
    private long lobby_id;

    private String game_id;

    private String gameStart;

    protected Lobby(){

    }

    public Lobby(String gameId, String gameStart){
        this.game_id = gameId;
        this.gameStart = gameStart;
    }

    public String getGameStart() {
        return gameStart;
    }

    public void setGameStart(String gameStart) {
        this.gameStart = gameStart;
    }

    public long getLobby_id() {
        return lobby_id;
    }

    public String getGame_id() {
        return game_id;
    }

    public void setGame_id(String game_id) {
        this.game_id = game_id;
    }
}
