package toppar.wine_guesser.presentation.app;

import toppar.wine_guesser.domain.ClubStats;

public class ClubForm {

    private ClubStats clubStats;
    private int clubId;

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public ClubStats getClubStats() {
        return clubStats;
    }

    public void setClubStats(ClubStats clubStats) {
        this.clubStats = clubStats;
    }
}