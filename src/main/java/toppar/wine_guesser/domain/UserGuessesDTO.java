package toppar.wine_guesser.domain;

public interface UserGuessesDTO {

    long getUserGuesses_id();
    String getUsername();
    int getServingOrderGuess();
    String getDescriptionGuess();
    String getGameId();
    String getRegionGuess();
}
