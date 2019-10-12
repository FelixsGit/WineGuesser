package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "user_guesses", schema = "public")
public class UserGuesses implements UserGuessesDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userGuessesId;
    private String username;
    private int servingOrderGuess;
    private String descriptionGuess;
    private String gameId;
    private String regionGuess;

    protected UserGuesses(){

    }

    public UserGuesses(String username, String gameId, String descriptionGuess, int servingOrderGuess, String regionGuess) {
        this.username = username;
        this.servingOrderGuess = servingOrderGuess;
        this.descriptionGuess = descriptionGuess;
        this.gameId = gameId;
        this.regionGuess = regionGuess;
    }

    public String getRegionGuess() {
        return regionGuess;
    }

    public void setRegionGuess(String regionGuess) {
        this.regionGuess = regionGuess;
    }

    public long getUserGuessesId() {
        return userGuessesId;
    }

    public void setUserGuessesId(long userGuessesId) {
        this.userGuessesId = userGuessesId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getServingOrderGuess() {
        return servingOrderGuess;
    }

    public void setServingOrderGuess(int servingOrderGuess) {
        this.servingOrderGuess = servingOrderGuess;
    }

    public String getDescriptionGuess() {
        return descriptionGuess;
    }

    public void setDescriptionGuess(String descriptionGuess) {
        this.descriptionGuess = descriptionGuess;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }
}
