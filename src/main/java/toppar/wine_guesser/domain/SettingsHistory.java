package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "settings_history")
public class SettingsHistory implements SettingsHistoryDTO{

    @Id
    private long gameSettingsId;
    private String gameHost;
    private String gameId;
    private String qrCode;
    private String url;
    private String description;
    private String servingOrder;


    /**
     * Required by JPA, do not use.
     */
    protected SettingsHistory() {

    }

    public SettingsHistory(long gameSettingsId, String gameId, String gameHost, String qrCode, String url, String description, String servingOrder){
        this.gameSettingsId = gameSettingsId;
        this.gameId = gameId;
        this.gameHost = gameHost;
        this.qrCode = qrCode;
        this.url = url;
        this.description = description;
        this.servingOrder = servingOrder;
    }

    public long getGameSettingsId() {
        return gameSettingsId;
    }

    public void setGameSettingsId(long gameSettingsId) {
        this.gameSettingsId = gameSettingsId;
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

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getServingOrder() {
        return servingOrder;
    }

    public void setServingOrder(String servingOrder) {
        this.servingOrder = servingOrder;
    }
}
