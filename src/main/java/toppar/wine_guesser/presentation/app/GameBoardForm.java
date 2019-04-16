package toppar.wine_guesser.presentation.app;

import toppar.wine_guesser.domain.LobbyDataDTO;

import java.util.List;

public class GameBoardForm {

    private String gameId;

    private List<String> descriptions;

    private List<String> guessNum;

    private String playerDone;

    private List<LobbyDataDTO> participantsNotDone;

    private List<LobbyDataDTO> participantsDone;

    private String gameHost;

    private String allDone;

    private int wineToRate;

    private String doneRating;

    private int wineRating;


    public String getDoneRating() {
        return doneRating;
    }

    public void setDoneRating(String doneRating) {
        this.doneRating = doneRating;
    }


    public int getWineToRate() {
        return wineToRate;
    }

    public void setWineToRate(int wineToRate) {
        this.wineToRate = wineToRate;
    }

    public int getWineRating() {
        return wineRating;
    }

    public void setWineRating(int wineRating) {
        this.wineRating = wineRating;
    }

    public String getAllDone() {
        return allDone;
    }

    public void setAllDone(String allDone) {
        this.allDone = allDone;
    }

    public String getGameHost() {
        return gameHost;
    }

    public void setGameHost(String gameHost) {
        this.gameHost = gameHost;
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

    public String getPlayerDone() {
        return playerDone;
    }

    public void setPlayerDone(String playerDone) {
        this.playerDone = playerDone;
    }

    public List<String> getGuessNum() {
        return guessNum;
    }

    public void setGuessNum(List<String> guessNum) {
        this.guessNum = guessNum;
    }

    public List<String> getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(List<String> descriptions) {
        this.descriptions = descriptions;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }
}
