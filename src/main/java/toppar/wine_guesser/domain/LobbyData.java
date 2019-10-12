package toppar.wine_guesser.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "`lobby_data`", schema = "public")
public class LobbyData implements LobbyDataDTO{

    private long lobby_id;
    private String gameHost;
    private String game_id;
    @Id
    private String participants;
    private int score;
    private int ready;
    private int done;

    protected LobbyData(){

    }


    public LobbyData(long lobbyId, String gameHost, String gameId, String participants, int score, int ready, int done) {
        this.lobby_id = lobbyId;
        this.gameHost = gameHost;
        this.game_id = gameId;
        this.participants = participants;
        this.score = score;
        this.ready = ready;
        this.done = done;
    }

    public String getGameHost() {
        return gameHost;
    }

    public void setGameHost(String gameHost) {
        this.gameHost = gameHost;
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

    public void setLobby_id(long lobby_id) {
        this.lobby_id = lobby_id;
    }

    public void setParticipants(String participants) {
        this.participants = participants;
    }


    public String getParticipants() {
        return participants;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getReady() {
        return ready;
    }

    public void setReady(int ready) {
        this.ready = ready;
    }

    public int getDone() {
        return done;
    }

    public void setDone(int done) {
        this.done = done;
    }
}
