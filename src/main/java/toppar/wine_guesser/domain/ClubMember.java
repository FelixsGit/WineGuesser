package toppar.wine_guesser.domain;


import javax.persistence.*;

@Entity
@Table(name = "`club_member`", schema = "public")
public class ClubMember implements ClubMemberDTO {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int clubMember_id;
    private int club_id;
    private String username;
    private String isBacchus;

    protected ClubMember() {

    }

    public ClubMember(int clubId, String username, String isBacchus) {
        this.club_id = clubId;
        this.username = username;
        this.isBacchus = isBacchus;
    }

    public String getIsBacchus() {
        return isBacchus;
    }

    public void setIsBacchus(String isBacchus) {
        this.isBacchus = isBacchus;
    }

    public int getClubMember_id() {
        return clubMember_id;
    }

    public void setClubMember_id(int clubMember_id) {
        this.clubMember_id = clubMember_id;
    }

    public int getClub_id() {
        return club_id;
    }

    public void setClub_id(int club_id) {
        this.club_id = club_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
