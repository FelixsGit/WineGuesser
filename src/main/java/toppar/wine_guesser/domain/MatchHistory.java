package toppar.wine_guesser.domain;

import javax.persistence.*;


@Entity
public class MatchHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int matchHistoryId;
    private int userResultsId;
    private String url;
    private String datePlayed;
    private String gameId;
    private String clubName;

    protected MatchHistory(){

    }

    public MatchHistory(int userResultsId, String datePlayed, String url, String gameId, String clubName) {
        this.userResultsId = userResultsId;
        this.url = url;
        this.datePlayed = datePlayed;
        this.gameId = gameId;
        this.clubName = clubName;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getDatePlayed() {
        return datePlayed;
    }

    public void setDatePlayed(String datePlayed) {
        this.datePlayed = datePlayed;
    }

    public int getMatchHistoryId() {
        return matchHistoryId;
    }

    public void setMatchHistoryId(int matchHistoryId) {
        this.matchHistoryId = matchHistoryId;
    }

    public int getUserResultsId() {
        return userResultsId;
    }

    public void setUserResultsId(int userResultsId) {
        this.userResultsId = userResultsId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}


