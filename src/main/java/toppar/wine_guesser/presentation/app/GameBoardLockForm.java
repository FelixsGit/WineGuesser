package toppar.wine_guesser.presentation.app;

import toppar.wine_guesser.domain.LobbyDataDTO;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

public class GameBoardLockForm {

    private List<LobbyDataDTO> participantsNotDone;

    private List<LobbyDataDTO> participantsDone;

    private String gameHost;

    private String allDone;

    private List<String> descriptions;

    private String gameId;

    private List<@NotNull(message="Inte tomt") @NotEmpty(message = "inte tomt") @NotBlank(message = "inte tomt")  String> guessNum;

    public List<String> getGuessNum() {
        return guessNum;
    }

    public void setGuessNum(List<String> guessNum) {
        this.guessNum = guessNum;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public List<LobbyDataDTO> getParticipantsNotDone() {
        return participantsNotDone;
    }

    public void setParticipantsNotDone(List<LobbyDataDTO> participantsNotDone) {
        this.participantsNotDone = participantsNotDone;
    }

    public List<LobbyDataDTO> getParticipantsDone() {
        return participantsDone;
    }

    public void setParticipantsDone(List<LobbyDataDTO> participantsDone) {
        this.participantsDone = participantsDone;
    }

    public String getGameHost() {
        return gameHost;
    }

    public void setGameHost(String gameHost) {
        this.gameHost = gameHost;
    }

    public String getAllDone() {
        return allDone;
    }

    public void setAllDone(String allDone) {
        this.allDone = allDone;
    }

    public List<String> getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(List<String> descriptions) {
        this.descriptions = descriptions;
    }
}
