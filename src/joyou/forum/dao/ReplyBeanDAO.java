package joyou.forum.dao;

import java.sql.Date;
import java.util.List;

import joyou.forum.model.ForumBean;
import joyou.forum.model.ReplyBean;

public interface ReplyBeanDAO {
	
	ReplyBean reply(ReplyBean rBean);
	
	ReplyBean select(Integer replyId);
	
	public List<ReplyBean> selectByContentId(Integer contentId);
	
	ReplyBean update(Integer replyId, String replyContent);
	
	ReplyBean update2(Integer replyId, Integer replyL);
	
	boolean delete(Integer replyId);

}
