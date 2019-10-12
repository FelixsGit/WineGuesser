package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "`club`", schema = "public")
public class Club implements ClubDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int clubId;
    private String clubName;
    private String clubPassword;
    private int numberOfTastings;
    private double numWinesCorrect;
    private double numWinesGuessed;
    private double averageWineCorrect;
    private String clubCreator;

    protected Club() {

    }

    public Club(String clubName, String clubPassword, int numberOfTastings, double numWinesCorrect, double numWinesGuessed, double averageWineCorrect, String clubCreator) {
        this.clubName = clubName;
        this.clubPassword = clubPassword;
        this.numberOfTastings = numberOfTastings;
        this.averageWineCorrect = averageWineCorrect;
        this.clubCreator = clubCreator;
        this.numWinesCorrect = numWinesCorrect;
        this.numWinesGuessed = numWinesGuessed;
    }


    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getClubPassword() {
        return clubPassword;
    }

    public void setClubPassword(String clubPassword) {
        this.clubPassword = clubPassword;
    }

    public int getNumberOfTastings() {
        return numberOfTastings;
    }

    public void setNumberOfTastings(int numberOfTastings) {
        this.numberOfTastings = numberOfTastings;
    }

    public double getNumWinesCorrect() {
        return numWinesCorrect;
    }

    public void setNumWinesCorrect(double numWinesCorrect) {
        this.numWinesCorrect = numWinesCorrect;
    }

    public double getNumWinesGuessed() {
        return numWinesGuessed;
    }

    public void setNumWinesGuessed(double numWinesGuessed) {
        this.numWinesGuessed = numWinesGuessed;
    }

    public double getAverageWineCorrect() {
        return averageWineCorrect;
    }

    public void setAverageWineCorrect(double averageWineCorrect) {
        this.averageWineCorrect = averageWineCorrect;
    }

    public String getClubCreator() {
        return clubCreator;
    }

    public void setClubCreator(String clubCreator) {
        this.clubCreator = clubCreator;
    }
}
