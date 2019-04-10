package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "game_settings")
public class GameSettings implements GameSettingsDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long gameSettingsId;
    private String gameHost;
    private String gameId;
    private String qrCode;
    private String url;
    private String description;
    private String servingOrder;

    @Override
    public long getGameSettingsId() {
        return gameSettingsId;
    }

    /**
     * Required by JPA, do not use.
     */
    protected GameSettings() {

    }

    public GameSettings(String gameId, String gameHost, String qrCode, String url, String description, String servingOrder){
        this.gameId = gameId;
        this.gameHost = gameHost;
        this.qrCode = qrCode;
        this.url = url;
        this.description = description;
        this.servingOrder = servingOrder;
    }

    public String getGameHost() {
        return gameHost;
    }

    public void setGameHost(String gameHost) {
        this.gameHost = gameHost;
    }

    @Override
    public String getServingOrder() {
        return servingOrder;
    }

    public void setServingOrder(String servingOrder) {
        this.servingOrder = servingOrder;
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
}