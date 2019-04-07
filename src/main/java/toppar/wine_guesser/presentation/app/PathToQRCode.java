package toppar.wine_guesser.presentation.app;

import java.util.List;

public class PathToQRCode {


    public String getByteAsString() {
        return byteAsString;
    }

    public void setByteAsString(String byteAsString) {
        this.byteAsString = byteAsString;
    }

    private String byteAsString;

    public List<String> getQrCodeList() {
        return qrCodeList;
    }

    public void setQrCodeList(List<String> qrCodeList) {
        this.qrCodeList = qrCodeList;
    }

    private List<String> qrCodeList;
}
