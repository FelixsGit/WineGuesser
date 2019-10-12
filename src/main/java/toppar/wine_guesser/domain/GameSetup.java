package toppar.wine_guesser.domain;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "game_setup", schema = "public")
public class GameSetup implements GameSetupDTO {

    @Id
    private String gameId;
    private String gameHost;
    private String amountOfWines;
    private String clubName;
    private String comment;

    /**
     * Required by JPA, do not use.
     */
    protected GameSetup() {

    }

    public GameSetup(String gameHost, String amountOfWines, String gameId, String clubName, String comment){
        this.gameHost = gameHost;
        this.amountOfWines = amountOfWines;
        this.gameId = gameId;
        this.clubName = clubName;
        this.comment = comment;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getGameHost() {
        return gameHost;
    }

    public void setGameHost(String gameHost) {
        this.gameHost = gameHost;
    }

    public String getAmountOfWines() {
        return amountOfWines;
    }

    public void setAmountOfWines(String amountOfWines) {
        this.amountOfWines = amountOfWines;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }
}
