package toppar.wine_guesser.presentation.app;

import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

public class EnterUrlForm {


    public List<String> getUrlList() {
        return urlList;
    }

    public void setUrlList(List<String> urlList) {
        this.urlList = urlList;
    }

    private List<@URL(message="Måste vara en URL länk")@NotEmpty(message = "Får inte vara tomt")@NotNull(message = "Får inte vara tomt") String> urlList;

    private String missing;

    public String getMissing() {
        return missing;
    }

    public void setMissing(String missing) {
        this.missing = missing;
    }
}
