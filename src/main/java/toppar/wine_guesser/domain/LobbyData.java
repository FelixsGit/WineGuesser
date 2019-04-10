package toppar.wine_guesser.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "lobby_data")
public class LobbyData {

    private long lobbyId;
    private String gameID;
    @Id
    private String participants;
    private int score;
    private int ready;
    private int done;

    protected LobbyData(){

    }


    public LobbyData(long lobbyId, String gameID, String participants, int score, int ready, int done) {
        this.lobbyId = lobbyId;
        this.gameID = gameID;
        this.participants = participants;
        this.score = score;
        this.ready = ready;
        this.done = done;
    }

    public long getLobbyId() {
        return lobbyId;
    }

    public void setLobbyId(long lobbyId) {
        this.lobbyId = lobbyId;
    }

    public void setParticipants(String participants) {
        this.participants = participants;
    }

    public String getGameID() {
        return gameID;
    }

    public void setGameID(String gameID) {
        this.gameID = gameID;
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
