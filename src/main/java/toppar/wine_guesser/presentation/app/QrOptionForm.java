package toppar.wine_guesser.presentation.app;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class QrOptionForm {

    private String id;
    private String url;
    private String parsedUrl;

    public String getParsedUrl() {
        return parsedUrl;
    }

    public void setParsedUrl(String parsedUrl) {
        this.parsedUrl = parsedUrl;
    }

    @NotEmpty(message = "Skriv in en serveringsOrdning")
    @Pattern(regexp="(^$|[1-9]{1})", message = "Ordningen måste vara 1 till 'antalet viner som serveras'")
    private String orderNum;

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
