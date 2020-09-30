package joyou.forum.dao;

import java.sql.Date;
import java.util.List;

import joyou.forum.model.ReplyBean;

public interface ReplyBeanDAO {
	
	ReplyBean reply(ReplyBean rBean);
	
	ReplyBean select(Integer replyId);
	
	List<ReplyBean> selectAll();
	
	ReplyBean update(Integer replyId, String replyContent, String ReplyDate);
	
	boolean delete(Integer replyId);

}
