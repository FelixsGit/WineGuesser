package toppar.wine_guesser.presentation.app;

import toppar.wine_guesser.domain.Club;
import toppar.wine_guesser.domain.ClubDTO;

import java.util.List;

public class ClubGameSetupForm {

    private String chosenClub;

    private List<Club> clubs;

    public String getChosenClub() {
        return chosenClub;
    }

    public void setChosenClub(String chosenClub) {
        this.chosenClub = chosenClub;
    }

    public List<Club> getClubs() {
        return clubs;
    }

    public void setClubs(List<Club> clubs) {
        this.clubs = clubs;
    }
}
