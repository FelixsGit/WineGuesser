package toppar.wine_guesser.presentation.app;

import java.util.List;

public class PrintQrCodesForm {

    private List<String> qrCodes;
    private String gameId;

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public List<String> getQrCodes() {
        return qrCodes;
    }

    public void setQrCodes(List<String> qrCodes) {
        this.qrCodes = qrCodes;
    }
}
