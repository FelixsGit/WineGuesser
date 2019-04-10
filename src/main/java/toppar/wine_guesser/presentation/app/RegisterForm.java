package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotEmpty;

public class RegisterForm {

    @NotEmpty(message = "Får inte vara tomt")
    private String username;
    @NotEmpty(message = "Får inte vara tomt")
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
