package toppar.wine_guesser.domain;

import java.util.List;

public class ProfileData {

    private UserResultsDTO userResultsDTO;
    private List<MatchHistory> matchHistoryList;
    private String username;

    public ProfileData(UserResultsDTO userResultsDTO, List<MatchHistory> matchHistoryList, String username) {
        this.userResultsDTO = userResultsDTO;
        this.matchHistoryList = matchHistoryList;
        this.username = username;
    }


    public UserResultsDTO getUserResultsDTO() {
        return userResultsDTO;
    }

    public void setUserResultsDTO(UserResultsDTO userResultsDTO) {
        this.userResultsDTO = userResultsDTO;
    }


    public List<MatchHistory> getMatchHistoryList() {
        return matchHistoryList;
    }

    public void setMatchHistoryList(List<MatchHistory> matchHistoryList) {
        this.matchHistoryList = matchHistoryList;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
