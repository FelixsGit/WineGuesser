package toppar.wine_guesser.domain;

public interface ResultDataDTO {

    int getResultData_id();
    int getGameResult_id();
    String getUsername();
    int getServingOrder();
    String getWinePicture();
    String getWineName();
    String getWineDescription();
    int getGrade();
    String getUrl();
    int getPersonalGrade();
    double getAverageGrade();
    String getRegion();
    String getCorrectRegionGuess();

}
