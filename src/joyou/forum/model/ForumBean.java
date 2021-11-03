package joyou.forum.model;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.gson.annotations.Expose;

import joyou.Orders.model.OrderItemBean;

@Entity
@Table(name="Forum")
public class ForumBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Expose
	Integer contentId;
	@Expose
	String contentTitle;
	@Expose
	String Content;
	@Expose
	String contentDate;
	@Expose
	String contentLatestUpdate;
	@Expose
	Integer memberId;
	@Expose
	String memberNickName;
	@Expose
	String imageFileName;
	
	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy="forumBean", cascade=CascadeType.ALL)
	Set<ReplyBean> cl = new LinkedHashSet<ReplyBean>();


	public ForumBean() {
		
	}
	
	public ForumBean(Integer contentId, String contentTitle, String Content, String contentDate, String contentLatestUpdate, Integer memberId, String memberNickName,Set<ReplyBean> cl) {
		this.contentId = contentId;
		this.contentTitle = contentTitle;
		this.Content = Content;
		this.contentDate = contentDate;
		this.contentLatestUpdate = contentLatestUpdate;
		this.memberId = memberId;
		this.memberNickName = memberNickName;
		this.cl = cl;
	}
	
	public ForumBean(Integer contentId, String contentTitle, String Content, String contentDate, String contentLatestUpdate, Integer memberId, String memberNickName, String imageFileName) {
		
		this.contentId = contentId;
		this.contentTitle = contentTitle;
		this.Content = Content;
		this.contentDate = contentDate;
		this.contentLatestUpdate = contentLatestUpdate;
		this.memberId = memberId;
		this.memberNickName = memberNickName;
		this.imageFileName = imageFileName;
	}

	public Integer getContentId() {
		return contentId;
	}

	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}


	public String getContentTitle() {
		return contentTitle;
	}

	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String Content) {
		this.Content = Content;
	}

	public String getContentDate() {
		return contentDate;
	}

	public void setContentDate(String contentDate) {
		this.contentDate = contentDate;
	}

	public String getContentLatestUpdate() {
		return contentLatestUpdate;
	}

	public void setContentLatestUpdate(String contentLatestUpdate) {
		this.contentLatestUpdate = contentLatestUpdate;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public Set<ReplyBean> getCl() {
		return cl;
	}

	public void setCl(Set<ReplyBean> cl) {
		this.cl = cl;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}


}
