package toppar.wine_guesser.domain;

public interface GameSettingsDTO {

    long getGameSettingsId();
    String getGameHost();
    String getGameId();
    String getQrCode();
    String getUrl();
    String getImgSource();
    String getWineName();
    String getDescription();
    String getServingOrder();
}
