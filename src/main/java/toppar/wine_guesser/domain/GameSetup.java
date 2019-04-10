package toppar.wine_guesser.domain;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "game_setup")
public class GameSetup implements GameSetupDTO {

    @Id
    private String gameId;
    private String gameHost;
    private String amountOfWines;

    /**
     * Required by JPA, do not use.
     */
    protected GameSetup() {

    }

    public GameSetup(String gameHost, String amountOfWines, String gameId){
        this.gameHost = gameHost;
        this.amountOfWines = amountOfWines;
        this.gameId = gameId;
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