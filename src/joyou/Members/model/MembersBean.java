package joyou.Members.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "memberTest1")
public class MembersBean {
	@Id
	@Column(name = "memberID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "memberAccount")
	private String account;
	
	@Column(name = "memberPassword")
	private String password;
	
	@Column(name = "memberMail")
	private String mail;
	
	@Column(name = "memberPhone")
	private String phone;
	
	@Column(name = "memberNickName")
	private String nickname;

	@Column(name = "memberTrueName")
	private String truename;

	@Column(name = "memberGender")
	private String gender;
	
	@Column(name = "memberPreferGameType")
	private Integer preferGameType;
	
	@Column(name = "memberImageFileName")
	private String imageFileName;

	@Column(name = "memberUserfoot")
	private String userfoot;

	// @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone
	// = "Asia/Taipei")
	// Date birthday;

	public MembersBean() {

	}

	public MembersBean(String account, String password, String mail, String nickname, String truename, String phone,
			String gender, Integer gameType, String imageFileName, String userfoot) {
		super();
		this.account = account;
		this.password = password;
		this.mail = mail;
		this.nickname = nickname;
		this.truename = truename;
		this.phone = phone;
		this.gender = gender;
		this.preferGameType = gameType;
		this.imageFileName = imageFileName;

		this.userfoot = userfoot;

	}



	
	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getNickName() {
		return nickname;
	}

	public void setNickName(String nickname) {
		this.nickname = nickname;
	}

	
	public String getTrueName() {
		return truename;
	}

	public void setTrueName(String truename) {
		this.truename = truename;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	
	public Integer getPreferGameType() {
		return preferGameType;
	}

	public void setPreferGameType(Integer preferGameType) {
		this.preferGameType = preferGameType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getUserfoot() {
		return userfoot;
	}

	public void setUserfoot(String userfoot) {
		this.userfoot = userfoot;
	}


}