package toppar.wine_guesser.presentation.app;

import toppar.wine_guesser.domain.LobbyDataDTO;

import java.util.List;

public class LobbyForm {

    private String gameId;

    private String gameHost;

    private List<LobbyDataDTO> participantsNotReady;

    private List<LobbyDataDTO> participantsReady;

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
