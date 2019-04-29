package toppar.wine_guesser.domain;

import java.util.List;

public class GameStats {

    /**
     * TODO Add String datatype to carry comment on the tasting!
     */

    private List<GamePointDTO> gamePointList;
    private List<ResultDataDTO> resultDataList;
    private String gameId;
    private String comment;

    public GameStats(List<GamePointDTO> gamePointList, List<ResultDataDTO> resultDataList, String gameId, String comment) {
        this.gamePointList = gamePointList;
        this.resultDataList = resultDataList;
        this.gameId = gameId;
        this.comment = comment;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public List<GamePointDTO> getGamePointList() {
        return gamePointList;
    }

    public void setGamePointList(List<GamePointDTO> gamePointList) {
        this.gamePointList = gamePointList;
    }

    public List<ResultDataDTO> getResultDataList() {
        return resultDataList;
    }

    public void setResultDataList(List<ResultDataDTO> resultDataList) {
        this.resultDataList = resultDataList;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }
}
