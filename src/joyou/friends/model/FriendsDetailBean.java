package joyou.friends.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;



@Entity
@Table(name="memberTest1")
public class FriendsDetailBean {
	
		private Integer friendId;
		private String account;
		private String mail;
		private String nickname;
		private String phone;
		private String gender;
		private String picturepath;
		private Integer gametypeid;


		
	

		public FriendsDetailBean() {

		}

		public FriendsDetailBean(Integer friendId,String account,String mail, String nickname, String phone,
				String gender,String picturepath,Integer gametypeid) {
			super();
			this.friendId = friendId;
			
			this.account = account;
			this.mail = mail;
			this.nickname = nickname;
			this.phone = phone;
			this.gender = gender;
			this.picturepath = picturepath;
			this.gametypeid = gametypeid;
		}
		
	
		@Id
		@Column(name = "memberID")
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		public Integer getFriendId() {
			return friendId;
		}

		public void setFriendId(Integer friendId) {
			this.friendId = friendId;
		}
		
		@Column(name = "memberAccount")
		public String getAccount() {
			return account;
		}

		public void setAccount(String account) {
			this.account = account;
		}
		@Column(name = "memberMail")
		public String getMail() {
			return mail;
		}

		public void setMail(String mail) {
			this.mail = mail;
		}
		
		@Column(name = "memberNickName")
		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		

		@Column(name = "memberPhone")
		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}
		
		@Column(name = "memberGender")
		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}
		
		 @Column(name = "memberPreferGameType")
		public Integer getGametypeid() {
			return gametypeid;
		}

		public void setGametypeid(Integer gametypeid) {
			this.gametypeid = gametypeid;
		}
		
		@Column(name = "memberImageFileName")
		public String getPicturepath() {
			return picturepath;
		}

		public void setPicturepath(String picturepath) {
			this.picturepath = picturepath;
		}

	

		

}
