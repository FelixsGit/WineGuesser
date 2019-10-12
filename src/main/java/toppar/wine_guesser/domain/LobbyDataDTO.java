package toppar.wine_guesser.domain;

public interface LobbyDataDTO {

    long getLobby_id();
    String getGameHost();
    String getGame_id();
    String getParticipants();
    int getScore();
    int getReady();
    int getDone();
}
