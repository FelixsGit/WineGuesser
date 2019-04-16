package toppar.wine_guesser.domain;

import javax.persistence.*;

@Entity
@Table(name = "result_data")
public class ResultData implements ResultDataDTO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int resultDataId;
    private int gameResultId;
    private String username;
    private int servingOrder;
    private String winePicture;
    private String wineName;
    private String wineDescription;
    private int grade;

    protected ResultData(){

    }

    public ResultData(int gameResultId, String username, int servingOrder, String winePicture, String wineName, String wineDescription, int grade) {
        this.gameResultId = gameResultId;
        this.username = username;
        this.servingOrder = servingOrder;
        this.winePicture = winePicture;
        this.wineName = wineName;
        this.wineDescription = wineDescription;
        this.grade = grade;
    }

    public int getResultDataId() {
        return resultDataId;
    }

    public void setResultDataId(int resultDataId) {
        this.resultDataId = resultDataId;
    }

    public int getGameResultId() {
        return gameResultId;
    }

    public void setGameResultId(int gameResultId) {
        this.gameResultId = gameResultId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getServingOrder() {
        return servingOrder;
    }

    public void setServingOrder(int servingOrder) {
        this.servingOrder = servingOrder;
    }

    public String getWinePicture() {
        return winePicture;
    }

    public void setWinePicture(String winePicture) {
        this.winePicture = winePicture;
    }

    public String getWineName() {
        return wineName;
    }

    public void setWineName(String wineName) {
        this.wineName = wineName;
    }

    public String getWineDescription() {
        return wineDescription;
    }

    public void setWineDescription(String wineDescription) {
        this.wineDescription = wineDescription;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }
}
