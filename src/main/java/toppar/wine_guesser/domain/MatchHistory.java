package toppar.wine_guesser.domain;

import javax.persistence.*;


@Entity
@Table(name = "`match_history`", schema = "public")
public class MatchHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int matchHistory_id;
    private int userResults_id;
    private String url;
    private String datePlayed;
    private String gameId;
    private String clubName;

    protected MatchHistory(){

    }

    public MatchHistory(int userResultsId, String datePlayed, String url, String gameId, String clubName) {
        this.userResults_id = userResultsId;
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

    public int getMatchHistory_id() {
        return matchHistory_id;
    }

    public void setMatchHistory_id(int matchHistory_id) {
        this.matchHistory_id = matchHistory_id;
    }

    public int getUserResults_id() {
        return userResults_id;
    }

    public void setUserResults_id(int userResults_id) {
        this.userResults_id = userResults_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}


