package toppar.wine_guesser.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "lobby", schema = "public")
public class Lobby implements LobbyDTO {

    @Id
    @Column(name = "lobby_id")
    private long lobbyId;

    @Column(name = "game_id")
    private String gameId;

    private String gameStart;

    protected Lobby(){

    }

    public Lobby(String gameId, String gameStart){
        this.gameId = gameId;
        this.gameStart = gameStart;
    }

    public String getGameStart() {
        return gameStart;
    }

    public void setGameStart(String gameStart) {
        this.gameStart = gameStart;
    }

    public long getLobbyId() {
        return lobbyId;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }
}
