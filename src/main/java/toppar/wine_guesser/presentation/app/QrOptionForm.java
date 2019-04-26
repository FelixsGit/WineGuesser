package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class QrOptionForm {

    private String id;
    private String url;
    private String parsedUrl;
    private String gameStatus;
    private String gameId;

    private String servingOrderAlreadyEntered;

    public String getServingOrderAlreadyEntered() {
        return servingOrderAlreadyEntered;
    }

    public void setServingOrderAlreadyEntered(String servingOrderAlreadyEntered) {
        this.servingOrderAlreadyEntered = servingOrderAlreadyEntered;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getGameStatus() {
        return gameStatus;
    }

    public void setGameStatus(String gameStatus) {
        this.gameStatus = gameStatus;
    }

    public String getParsedUrl() {
        return parsedUrl;
    }

    public void setParsedUrl(String parsedUrl) {
        this.parsedUrl = parsedUrl;
    }

    private String orderNum;

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
