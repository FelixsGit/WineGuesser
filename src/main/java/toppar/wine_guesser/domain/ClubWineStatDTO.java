package toppar.wine_guesser.domain;

public interface ClubWineStatDTO {

    int getClubWineStatId();
    int getClubId();
    String getWineName();
    String getWineUrl();
    int getNumberOfServings();
    double getAverageGrade();
}
