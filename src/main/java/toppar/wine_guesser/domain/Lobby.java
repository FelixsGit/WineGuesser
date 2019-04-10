package toppar.wine_guesser.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "lobby")
public class Lobby implements LobbyDTO {

    @Id
    private long lobbyId;

    private String gameId;

    protected Lobby(){

    }

    public Lobby(String gameId){
        this.gameId = gameId;
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
