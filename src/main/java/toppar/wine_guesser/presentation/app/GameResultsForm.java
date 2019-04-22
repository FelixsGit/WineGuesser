package toppar.wine_guesser.presentation.app;

import toppar.wine_guesser.domain.GameStats;

public class GameResultsForm {

    private GameStats gameStats;

    public GameStats getGameStats() {
        return gameStats;
    }

    private String viewer;

    public String getViewer() {
        return viewer;
    }

    public void setViewer(String viewer) {
        this.viewer = viewer;
    }

    public void setGameStats(GameStats gameStats) {
        this.gameStats = gameStats;
    }
}
