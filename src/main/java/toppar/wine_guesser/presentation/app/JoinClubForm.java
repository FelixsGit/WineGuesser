package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotEmpty;

public class JoinClubForm {

    @NotEmpty(message = "Kan inte vara tomt")
    private String clubName;
    @NotEmpty(message = "Kan inte vara tomt")
    private String clubPassword;

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
}
