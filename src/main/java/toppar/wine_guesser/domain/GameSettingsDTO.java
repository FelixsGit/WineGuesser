package toppar.wine_guesser.domain;

public interface GameSettingsDTO {

    long getGameSettingsId();
    String getGameId();
    String getQrCode();
    String getUrl();
    String getDescription();
}
