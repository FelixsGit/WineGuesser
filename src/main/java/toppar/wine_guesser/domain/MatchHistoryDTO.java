package toppar.wine_guesser.domain;

public interface MatchHistoryDTO {

    int getMatchHistoryId();
    int getGameResultId();
    String getUrl();
    String getDatePlayed();
    String getGameId();
    String getClubName();
}
