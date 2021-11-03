package joyou.friends.model;







import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


import javax.persistence.Table;




@Entity
@Table(name="Friends")
public class FriendsBean {
	private int friends_numbs;
	private int memberId;
	private int friendId;
	
	
	
	public FriendsBean() {		
	}
	
	public FriendsBean(int friends_numbs) {

		this.friends_numbs = friends_numbs;
		
	
	}
	
	public FriendsBean(int friends_numbs,int  memberId,int friendId,FriendsDetailBean friendsDetailBean) {
		this.friends_numbs = friends_numbs;
		this.memberId = memberId;
		this.friendId = friendId;
	
	}
	@Id
	@Column(name = "friends_numbs")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getFriends_numbs() {
		return friends_numbs;
	}
	public void setFriends_numbs(int friends_numbs) {
		this.friends_numbs = friends_numbs;
	}
	
	

	@Column(name = "memberId")
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	@Column(name = "friendId")
	public int getFriendId() {
		return friendId;
	}

	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}
	

	
	
}
