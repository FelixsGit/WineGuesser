package toppar.wine_guesser.domain;

public class UserResultData {

    private String username;
    private double pointCollected;
    private double gamesPlayed;
    private double newCorrectPercent;

    public UserResultData(String username, double pointCollected, double gamesPlayed, double newCorrectPercent) {
        this.username = username;
        this.pointCollected = pointCollected;
        this.gamesPlayed = gamesPlayed;
        this.newCorrectPercent = newCorrectPercent;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void increasePointsCollected(int pointsToAdd){
        this.pointCollected += pointsToAdd;
    }


    public double getPointCollected() {
        return pointCollected;
    }

    public void setPointCollected(double pointCollected) {
        this.pointCollected = pointCollected;
    }

    public double getGamesPlayed() {
        return gamesPlayed;
    }

    public void setGamesPlayed(double gamesPlayed) {
        this.gamesPlayed = gamesPlayed;
    }

    public double getNewCorrectPercent() {
        return newCorrectPercent;
    }

    public void setNewCorrectPercent(double newCorrectPercent) {
        this.newCorrectPercent = newCorrectPercent;
    }
}
