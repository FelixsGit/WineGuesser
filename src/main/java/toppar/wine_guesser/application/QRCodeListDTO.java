package toppar.wine_guesser.application;

import java.util.List;

public class QRCodeListDTO {

    public List<String> getQrCodeList() {
        return qrCodeList;
    }

    public void setQrCodeList(List<String> qrCodeList) {
        this.qrCodeList = qrCodeList;
    }

    private List<String> qrCodeList;

    public QRCodeListDTO(List<String> qrCodeList){
        this.qrCodeList = qrCodeList;
    }

    public void addQRCodeToList(String qrCode) {
        this.qrCodeList.add(qrCode);
    }
}
