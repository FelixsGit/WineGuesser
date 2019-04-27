package toppar.wine_guesser.domain;

public interface ClubDTO {

    int getClubId();
    String getClubName();
    String getClubPassword();
    int getNumberOfTastings();
    double getAverageWineCorrect();
    String getClubCreator();
}
