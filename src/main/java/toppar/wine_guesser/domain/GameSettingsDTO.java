package toppar.wine_guesser.domain;

public interface GameSettingsDTO {

    long getGameSettings_id();
    String getGameHost();
    String getGame_id();
    String getQrCode();
    String getUrl();
    String getImgSource();
    String getWineName();
    String getRegion();
    String getDescription();
    String getServingOrder();
}
