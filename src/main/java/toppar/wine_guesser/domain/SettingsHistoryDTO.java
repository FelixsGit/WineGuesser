package toppar.wine_guesser.domain;

public interface SettingsHistoryDTO {

    long getGameSettingsId();
    String getGameHost();
    String getGameId();
    String getQrCode();
    String getUrl();
    String getDescription();
    String getServingOrder();
}
