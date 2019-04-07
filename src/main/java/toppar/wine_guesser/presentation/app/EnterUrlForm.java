package toppar.wine_guesser.presentation.app;


import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class EnterUrlForm {

    private static final String URL_FORMAT_ERROR_MSG = "Must be an url";

    @NotBlank
    @NotNull
    @NotEmpty
    @URL(message = URL_FORMAT_ERROR_MSG)
    private String wineUrl;

    public static String getUrlFormatErrorMsg() {
        return URL_FORMAT_ERROR_MSG;
    }

    public String getWineUrl() {
        return wineUrl;
    }

    public void setWineUrl(String wineUrl) {
        this.wineUrl = wineUrl;
    }

}
