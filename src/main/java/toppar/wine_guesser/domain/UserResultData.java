package toppar.wine_guesser.domain;

public class UserResultData {

    private String username;
    private double pointCollectedTotal;
    private double pointCollectedWines;

    public UserResultData(String username, double pointCollectedTotal, double pointCollectedWines) {
        this.username = username;
        this.pointCollectedTotal = pointCollectedTotal;
        this.pointCollectedWines = pointCollectedWines;
    }

    public void increasePointCollectedTotal(double points){
        this.pointCollectedTotal += points;
    }

    public void increasePointCollectedWines(double points){
        this.pointCollectedWines += points;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getPointCollectedTotal() {
        return pointCollectedTotal;
    }

    public void setPointCollectedTotal(double pointCollectedTotal) {
        this.pointCollectedTotal = pointCollectedTotal;
    }

    public double getPointCollectedWines() {
        return pointCollectedWines;
    }

    public void setPointCollectedWines(double pointCollectedWines) {
        this.pointCollectedWines = pointCollectedWines;
    }
}
