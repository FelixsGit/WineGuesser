package toppar.wine_guesser.domain;


import javax.persistence.*;

@Entity
@Table(name = "club_member")
public class ClubMember implements ClubMemberDTO {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int clubMemberId;
    private int clubId;
    private String username;

    protected ClubMember() {

    }

    public ClubMember(int clubId, String username) {
        this.clubId = clubId;
        this.username = username;
    }


    public int getClubMemberId() {
        return clubMemberId;
    }

    public void setClubMemberId(int clubMemberId) {
        this.clubMemberId = clubMemberId;
    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
