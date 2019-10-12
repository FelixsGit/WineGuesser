package toppar.wine_guesser.domain;


import javax.persistence.*;

@Entity
@Table(name = "club_wine_stat", schema = "public")
public class ClubWineStat implements ClubWineStatDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "clubWineStat_id")
    private int clubWineStatId;
    @Column(name = "club_id")
    private int clubId;
    private String wineName;
    private String wineUrl;
    private int numberOfServings;
    private double averageGrade;

    protected ClubWineStat() {

    }

    public ClubWineStat(int clubId, String wineName, String wineUrl, int numberOfServings, double averageGrade) {
        this.clubId = clubId;
        this.wineName = wineName;
        this.numberOfServings = numberOfServings;
        this.averageGrade = averageGrade;
        this.wineUrl = wineUrl;
    }

    public String getWineUrl() {
        return wineUrl;
    }

    public void setWineUrl(String wineUrl) {
        this.wineUrl = wineUrl;
    }

    public int getClubWineStatId() {
        return clubWineStatId;
    }

    public void setClubWineStatId(int clubWineStatId) {
        this.clubWineStatId = clubWineStatId;
    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public String getWineName() {
        return wineName;
    }

    public void setWineName(String wineName) {
        this.wineName = wineName;
    }

    public int getNumberOfServings() {
        return numberOfServings;
    }

    public void setNumberOfServings(int numberOfServings) {
        this.numberOfServings = numberOfServings;
    }

    public double getAverageGrade() {
        return averageGrade;
    }

    public void setAverageGrade(double averageGrade) {
        this.averageGrade = averageGrade;
    }
}
