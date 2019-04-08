package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class JoinGameLobbyForm {

    @NotEmpty(message = "Please enter your join code")
    @Pattern(regexp="(^$|[0-9]{6})", message = "Must be a positive 6 digit integer number")
    private String joinCode;

    public String getJoinCode() {
        return joinCode;
    }

    public void setJoinCode(String joinCode) {
        this.joinCode = joinCode;
    }
}
