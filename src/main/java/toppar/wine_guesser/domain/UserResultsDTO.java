package toppar.wine_guesser.domain;

public interface UserResultsDTO {

    int getUserResultsId();
    String getUsername();
    int getPlayedGames();
    double getCorrectPercent();
    int getWins();
    double getNumWinesGuessed();
    double getNumWinesCorrect();
    void setCorrectPercent(double correctPercent);
}
