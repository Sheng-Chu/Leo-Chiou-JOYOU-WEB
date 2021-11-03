package joyou.forum.dao;

import java.util.List;

import joyou.forum.model.ForumBean;

public interface ForumBeanDAO {
    
	
    ForumBean insert(ForumBean fBean);

	ForumBean select(Integer contentId);

	List<ForumBean> selectAll();
	
	ForumBean update(Integer contentId, String contentTitle,String date);

	boolean delete(Integer contentId);
	
}
