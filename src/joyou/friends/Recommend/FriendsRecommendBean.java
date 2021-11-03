package joyou.friends.Recommend;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Friends")
public class FriendsRecommendBean {
	private Integer memID;
	private Integer friID;
	private Integer friendshipID;

	
	public FriendsRecommendBean() {
	}
	
	public FriendsRecommendBean(Integer memID,Integer friID) {
		this.memID = memID;
		this.friID = friID;
			}

	@Id
	@Column(name = "friends_numbs")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getfriendshipID() {
		return friendshipID;
	}
	
	public void setfriendshipID(Integer friendshipID) {
		this.friendshipID = friendshipID;
	}
	
	@Column(name = "memberId")
	public Integer getmemID() {
		return memID;
	}

	public void setmemID(Integer memID) {
		this.memID = memID;
	}
	
	@Column(name = "friendId")
	public Integer getfriID() {
		return friID;
	}

	public void setfriID(Integer friID) {
		this.friID = friID;
	}
	
	
	
	
	
}
