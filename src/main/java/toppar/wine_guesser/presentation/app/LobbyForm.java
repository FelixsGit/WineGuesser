package toppar.wine_guesser.presentation.app;

import toppar.wine_guesser.domain.LobbyDataDTO;

import java.util.List;

public class LobbyForm {

    private String gameId;

    private String username;

    private String gameHost;

    private String clubName;

    private List<LobbyDataDTO> participantsNotReady;

    private List<LobbyDataDTO> participantsReady;

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGameHost() {
        return gameHost;
    }

    public void setGameHost(String gameHost) {
        this.gameHost = gameHost;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public List<LobbyDataDTO> getParticipantsNotReady() {
        return participantsNotReady;
    }

    public void setParticipantsNotReady(List<LobbyDataDTO> participantsNotReady) {
        this.participantsNotReady = participantsNotReady;
    }

    public List<LobbyDataDTO> getParticipantsReady() {
        return participantsReady;
    }

    public void setParticipantsReady(List<LobbyDataDTO> participantsReady) {
        this.participantsReady = participantsReady;
    }
}
