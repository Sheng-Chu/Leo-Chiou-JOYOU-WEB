package joyou.forum.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import joyou.forum.model.ForumBean;

@Service
public interface ForumBeanService {
	
	ForumBean insert(ForumBean flBean);
	
	ForumBean select(Integer contentId);
	
	List<ForumBean> selectAll(Integer contentId);
	
	ForumBean update(Integer contentId, String contentTitle, String contentLatestUpdate);
	
	boolean delete(Integer contentId);


}
