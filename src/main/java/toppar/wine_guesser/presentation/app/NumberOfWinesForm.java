package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class NumberOfWinesForm {

    @NotEmpty(message = "Please enter a amount")
    @Pattern(regexp="(^$|[2-9]{1})", message = "Must be between 1 and 10")
    private String numWines;

    public String getNumWines() {
        return numWines;
    }

    public void setNumWines(String numWines) {
        this.numWines = numWines;
    }
}
