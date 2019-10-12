package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "`user`", schema = "public")
public class User implements UserDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long user_Id;
    private String username;
    private String password;
    private String activeGame;

    /**
     * Required by JPA, do not use.
     */
    protected User() {

    }

    public User(String username, String password, String activeGame){
        this.username = username;
        this.password = password;
        this.activeGame = activeGame;
    }


    public String getActiveGame() {
        return activeGame;
    }

    public void setActiveGame(String activeGame) {
        this.activeGame = activeGame;
    }

    public long getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(long user_Id) {
        this.user_Id = user_Id;
    }

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
