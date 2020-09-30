package joyou.forum.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import joyou.forum.model.ReplyBean;
@Service
public interface ReplyBeanService {
	
	ReplyBean reply(ReplyBean rBean);
	
	ReplyBean select(Integer replyId);
	
	List<ReplyBean> selectAll(Integer replyId);
	
	ReplyBean update(Integer replyId, String replyContent, String ReplyDate);
	
	boolean delete(Integer replyId);


}
