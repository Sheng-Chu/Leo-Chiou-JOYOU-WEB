package joyou.forum.model;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

import joyou.Orders.model.OrderItemBean;

@Entity
@Table(name="Forum")
public class ForumBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer contentId;
	
	Integer gameTypeId;
	
	String contentTitle;
	
	String Content;
	
	Integer replyId;
	
	String contentType;
	
	String contentDate;
	
	String contentLatestUpdate;
	
	Integer memberId;
	
	String memberNickName;
	
	public ForumBean() {
		
	}
	
//	@OneToMany(mappedBy="ForumBean", cascade=CascadeType.ALL)
//	Set<ForumBean> items = new LinkedHashSet<>();
//	String remarks;

	
	public ForumBean(Integer contentId, Integer gameTypeId, String contentTitle, String Content, String contentType, String contentDate, String contentLatestUpdate, Integer memberId, String memberNickName ) {
		
		this.contentId = contentId;
		this.gameTypeId = gameTypeId;
		this.contentTitle = contentTitle;
		this.Content = Content;
		this.replyId = replyId;
		this.contentType = contentType;
		this.contentDate = contentDate;
		this.contentLatestUpdate = contentLatestUpdate;
		this.memberId = memberId;
		this.memberNickName = memberNickName;
	}

	public Integer getContentId() {
		return contentId;
	}

	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}

	public Integer getGameTypeId() {
		return gameTypeId;
	}

	public void setGameType(Integer gameType) {
		this.gameTypeId = gameType;
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

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		replyId = replyId;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
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
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Fourm [contentId=");
		builder.append(contentId);
		builder.append(", gameTypeId=");
		builder.append(gameTypeId);
		builder.append(", contentTitle=");
		builder.append(contentTitle);
		builder.append(", Content=");
		builder.append(Content);
		builder.append(", replyId=");
		builder.append(replyId);
		builder.append(", contentType=");
		builder.append(contentType);
		builder.append(", contentDate=");
		builder.append(contentDate);
		builder.append(", contentLatestDate=");
		builder.append(contentLatestUpdate);
		builder.append(", memberId=");
		builder.append(memberId);
		builder.append(", memberNickName");
		builder.append(memberNickName);
		builder.append("]");
		return builder.toString();
	}
}
