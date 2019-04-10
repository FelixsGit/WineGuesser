package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class LoginForm {

    @NotNull(message = "Får inte vara tomt")
    @NotBlank(message = "Får inte vara tomt")
    private String username;
    @NotNull(message = "Får inte vara tomt")
    @NotBlank(message = "Får inte vara tomt")
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
