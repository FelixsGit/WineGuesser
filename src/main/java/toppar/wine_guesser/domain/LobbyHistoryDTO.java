package toppar.wine_guesser.domain;

public interface LobbyHistoryDTO {

    long getLobbyId();
    String getGameHost();
    String getGameId();
    String getParticipants();
    int getScore();
    int getReady();
    int getDone();
}
