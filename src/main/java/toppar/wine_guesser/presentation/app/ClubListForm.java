package toppar.wine_guesser.presentation.app;


import toppar.wine_guesser.domain.ClubDTO;

import java.util.List;

public class ClubListForm {

    private List<ClubDTO> clubDTOList;

    public List<ClubDTO> getClubDTOList() {
        return clubDTOList;
    }

    public void setClubDTOList(List<ClubDTO> clubDTOList) {
        this.clubDTOList = clubDTOList;
    }
}
