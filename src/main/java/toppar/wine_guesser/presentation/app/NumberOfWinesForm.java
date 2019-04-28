package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.util.List;

public class NumberOfWinesForm {

    @NotEmpty(message = "Skriv in ett antal")
    @Pattern(regexp="(^$|[2-9]{1})", message = "Antal från 2 till 9")
    private String numWines;

    public String getNumWines() {
        return numWines;
    }

    public void setNumWines(String numWines) {
        this.numWines = numWines;
    }
}
