package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class JoinGameLobbyForm {

    @NotEmpty(message = "Skriv in en kod")
    @Pattern(regexp="(^$|[0-9]{6})", message = "Måste vara en positivt 6 siffrigt heltal")
    private String joinCode;

    public String getJoinCode() {
        return joinCode;
    }

    public void setJoinCode(String joinCode) {
        this.joinCode = joinCode;
    }
}
