package toppar.wine_guesser.domain;

public interface UserResultsDTO {

    int getUserResults_id();
    String getUsername();
    int getPlayedGames();
    double getCorrectPercent();
    int getWins();
    double getNumWinesGuessed();
    double getNumWinesCorrect();
    void setCorrectPercent(double correctPercent);
    String getIsBacchus();
}
