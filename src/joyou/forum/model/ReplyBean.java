package joyou.forum.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

import joyou.Orders.model.OrdersBean;

@Entity
@Table(name = "Replys")
public class ReplyBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer replyId;

	String replyContent;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Taipei")
	String replyDate;

	Integer contentId;

	Integer memberId;

	String memberNickName;
	
//	@ManyToOne
//	@JoinColumn(name = "contentId")
//	ForumBean fBean;
	
	public ReplyBean() {
		
	}

	public ReplyBean(Integer replyId, String replyContent, String replyDate, Integer memberId, String memberNickName) {
		
		this.replyId = replyId;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.contentId = contentId;
		this.memberId = memberId;
		this.memberNickName = memberNickName;
		
	}

//	public ForumBean getfBean() {
//		return fBean;
//	}
//
//	public void setfBean(ForumBean fBean) {
//		this.fBean = fBean;
//	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
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
	
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Replys [replyId=");
		builder.append(replyId);
		builder.append(", replyContent=");
		builder.append(replyContent);
		builder.append(", replyDate=");
		builder.append(replyDate);
		builder.append(", contentId=");
		builder.append(memberId);
		builder.append(", memberId=");
		builder.append(memberId);
		builder.append(", memberNickName");
		builder.append(memberNickName);
		builder.append("]");
		return builder.toString();
	}

}

