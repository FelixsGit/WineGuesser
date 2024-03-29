package toppar.wine_guesser.domain;

import java.util.List;

public class ClubStats {

    private ClubDTO clubDTO;
    private List<ClubMemberDTO> memberList;
    private List<ClubWineStatDTO> wineStats;

    public ClubStats(ClubDTO clubDTO, List<ClubMemberDTO> memberList, List<ClubWineStatDTO> wineStats) {
        this.clubDTO = clubDTO;
        this.memberList = memberList;
        this.wineStats = wineStats;
    }

    public ClubDTO getClubDTO() {
        return clubDTO;
    }

    public void setClubDTO(ClubDTO clubDTO) {
        this.clubDTO = clubDTO;
    }

    public List<ClubMemberDTO> getMemberList() {
        return memberList;
    }

    public void setMemberList(List<ClubMemberDTO> memberList) {
        this.memberList = memberList;
    }

    public List<ClubWineStatDTO> getWineStats() {
        return wineStats;
    }

    public void setWineStats(List<ClubWineStatDTO> wineStats) {
        this.wineStats = wineStats;
    }
}
