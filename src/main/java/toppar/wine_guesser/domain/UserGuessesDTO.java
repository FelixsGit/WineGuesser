package toppar.wine_guesser.domain;

public interface UserGuessesDTO {

    long getUserGuessesId();
    String getUsername();
    int getServingOrderGuess();
    String getDescriptionGuess();
    String getGameId();
}
