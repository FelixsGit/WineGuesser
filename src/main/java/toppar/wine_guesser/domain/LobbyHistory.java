package toppar.wine_guesser.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "`lobby_history`", schema = "public")
public class LobbyHistory implements LobbyHistoryDTO{

    private long lobbyId;
    private String gameHost;
    private String gameId;
    @Id
    private String participants;
    private int score;
    private int ready;
    private int done;

    protected LobbyHistory(){

    }


    public LobbyHistory(long lobbyId, String gameHost, String gameId, String participants, int score, int ready, int done) {
        this.lobbyId = lobbyId;
        this.gameHost = gameHost;
        this.gameId = gameId;
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

    public long getLobbyId() {
        return lobbyId;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public void setLobbyId(long lobbyId) {
        this.lobbyId = lobbyId;
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