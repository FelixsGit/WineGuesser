package toppar.wine_guesser.domain;

public interface LobbyHistoryDTO {

    long getLobby_id();
    String getGameHost();
    String getGame_id();
    String getParticipants();
    int getScore();
    int getReady();
    int getDone();
}
