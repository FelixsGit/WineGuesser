package toppar.wine_guesser.domain;

public interface ClubDTO {

    int getClubId();
    String getClubName();
    String getClubPassword();
    int getNumberOfTastings();
    double getNumWinesGuessed();
    double getNumWinesCorrect();
    double getAverageWineCorrect();
    void setAverageWineCorrect(double averageWineCorrect);
    String getClubCreator();
}
