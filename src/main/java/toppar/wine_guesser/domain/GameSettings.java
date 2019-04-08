package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "game_settings")
public class GameSettings implements GameSettingsDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long gameSettingsId;
    private String gameId;
    private String qrCode;
    private String url;
    private String description;

    @Override
    public long getGameSettingsId() {
        return gameSettingsId;
    }

    /**
     * Required by JPA, do not use.
     */
    protected GameSettings() {

    }

    public GameSettings(String gameId, String qrCode, String url, String description){
        this.gameId = gameId;
        this.qrCode = qrCode;
        this.url = url;
        this.description = description;
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
