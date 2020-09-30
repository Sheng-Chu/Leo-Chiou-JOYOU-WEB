package joyou.Group.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
@Table(name="Groups")
public class Groups {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer groupId;
	 String groupname;
	 Integer gametypeId;
	 Integer groupCount;
	  String groupTime;
	 Integer storeId;
	 Integer groupprice;
	 Integer memberID;
	 Integer groupmember;
	  String startdate;
	  String enddate;
	  String deadline;
	 String storeAddress;
	 Integer limit;	
	 Integer groupnumber;
	 String groupdescription;
	public Groups() {
	}

	public Groups(Integer groupId, String groupname,Integer gametypeId,Integer groupCount,String groupTime,Integer storeId,Integer groupprice,Integer memberID,Integer groupmember,String startdate,String enddate,String deadline,String storeAddress,Integer limit,Integer groupnumber,String groupdescription) {
		this.groupId = groupId;
		this.groupname = groupname;
		this.gametypeId = gametypeId;
		this.groupCount = groupCount;
		this.groupTime = groupTime;
		this.storeId = storeId;
		this.groupprice = groupprice;
		this.memberID = memberID;
		this.groupmember = groupmember;
		this.startdate = startdate;
		this.enddate = enddate;
		this.deadline = deadline;
		this.storeAddress = storeAddress;
		this.limit = limit;
		this.groupnumber = groupnumber;
		this.groupdescription = groupdescription;
	}


	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public Integer getGametypeId() {
		return gametypeId;
	}

	public void setGametypeId(Integer gametypeId) {
		this.gametypeId = gametypeId;
	}

	public Integer getGroupCount() {
		return groupCount;
	}

	public void setGroupCount(Integer groupCount) {
		this.groupCount = groupCount;
	}

	public String getGroupTime() {
		return groupTime;
	}

	public void setGroupTime(String groupTime) {
		this.groupTime = groupTime;
	}

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Integer getGroupprice() {
		return groupprice;
	}

	public void setGroupprice(Integer groupprice) {
		this.groupprice = groupprice;
	}

	public Integer getMemberID() {
		return memberID;
	}

	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}

	public Integer getGroupmember() {
		return groupmember;
	}

	public void setGroupmember(Integer groupmember) {
		this.groupmember = groupmember;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public Integer getGroupnumber() {
		return groupnumber;
	}

	public void setGroupnumber(Integer groupnumber) {
		this.groupnumber = groupnumber;
	}

	public String getGroupdescription() {
		return groupdescription;
	}

	public void setGroupdescription(String groupdescription) {
		this.groupdescription = groupdescription;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Groups [groupId=");
		builder.append(groupId);
		builder.append(", groupname=");
		builder.append(groupname);
		builder.append(", gametypeId=");
		builder.append(gametypeId);
		builder.append(", groupCount=");
		builder.append(groupCount);
		builder.append(", groupTime=");
		builder.append(groupTime);
		builder.append(", storeId=");
		builder.append(storeId);
		builder.append(", groupprice=");
		builder.append(groupprice);
		builder.append(", memberID=");
		builder.append(memberID);
		builder.append(", groupmember=");
		builder.append(groupmember);
		builder.append(", startdate=");
		builder.append(startdate);
		builder.append(", enddate=");
		builder.append(enddate);
		builder.append(", deadline=");
		builder.append(deadline);
		builder.append(", storeAddress=");
		builder.append(storeAddress);
		builder.append(", limit=");
		builder.append(limit);
		builder.append(", groupnumber=");
		builder.append(groupnumber);
		builder.append(", groupdescription=");
		builder.append(groupdescription);
		builder.append("]");
		return builder.toString();
	}
}
