package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotEmpty;
import java.util.List;

public class EnterUrlForm {


    public List<String> getUrlList() {
        return urlList;
    }

    public void setUrlList(List<String> urlList) {
        this.urlList = urlList;
    }

    @NotEmpty
    private List<String> urlList;

    private String missing;

    public String getMissing() {
        return missing;
    }

    public void setMissing(String missing) {
        this.missing = missing;
    }
}
