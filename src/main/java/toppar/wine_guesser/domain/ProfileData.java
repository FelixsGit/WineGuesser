package toppar.wine_guesser.domain;

import java.util.List;

public class ProfileData {

    private UserResultsDTO userResultsDTO;
    private List<MatchHistory> matchHistoryList;
    private String username;
    private List<String> clubNameList;

    public ProfileData(UserResultsDTO userResultsDTO, List<MatchHistory> matchHistoryList, String username, List<String> clubNameList) {
        this.userResultsDTO = userResultsDTO;
        this.matchHistoryList = matchHistoryList;
        this.username = username;
        this.clubNameList = clubNameList;
    }

    public List<String> getClubNameList() {
        return clubNameList;
    }

    public void setClubNameList(List<String> clubNameList) {
        this.clubNameList = clubNameList;
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
