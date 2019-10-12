package toppar.wine_guesser.domain;

public interface LobbyDataDTO {

    long getLobbyId();
    String getGameHost();
    String getGameId();
    String getParticipants();
    int getScore();
    int getReady();
    int getDone();
}
