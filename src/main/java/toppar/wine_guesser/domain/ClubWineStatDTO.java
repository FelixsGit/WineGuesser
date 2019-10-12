package toppar.wine_guesser.domain;

public interface ClubWineStatDTO {

    int getClubWineStat_id();
    int getClub_id();
    String getWineName();
    String getWineUrl();
    int getNumberOfServings();
    double getAverageGrade();
}
