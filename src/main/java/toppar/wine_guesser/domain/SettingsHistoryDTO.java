package toppar.wine_guesser.domain;

public interface SettingsHistoryDTO {

    long getGameSettings_id();
    String getGameHost();
    String getGameId();
    String getQrCode();
    String getUrl();
    String getDescription();
    String getServingOrder();
}
