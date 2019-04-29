package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class CommentGameSetupForm {

    @NotBlank
    @NotNull
    private String comment;
    private String gameId;

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
