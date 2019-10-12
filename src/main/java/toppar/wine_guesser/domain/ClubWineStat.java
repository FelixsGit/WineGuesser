package toppar.wine_guesser.domain;


import javax.persistence.*;

@Entity
@Table(name = "`club_wine_stat`", schema = "public")
public class ClubWineStat implements ClubWineStatDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int clubWineStat_id;
    private int club_id;
    private String wineName;
    private String wineUrl;
    private int numberOfServings;
    private double averageGrade;

    protected ClubWineStat() {

    }

    public ClubWineStat(int clubId, String wineName, String wineUrl, int numberOfServings, double averageGrade) {
        this.club_id = clubId;
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

    public int getClubWineStat_id() {
        return clubWineStat_id;
    }

    public void setClubWineStat_id(int clubWineStat_id) {
        this.clubWineStat_id = clubWineStat_id;
    }

    public int getClub_id() {
        return club_id;
    }

    public void setClub_id(int club_id) {
        this.club_id = club_id;
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
