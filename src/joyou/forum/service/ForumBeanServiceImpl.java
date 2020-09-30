package joyou.forum.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import joyou.forum.dao.ForumBeanDAOImpl;
import joyou.forum.model.ForumBean;

@Service
@Transactional
@EnableTransactionManagement
public class ForumBeanServiceImpl implements ForumBeanService {
	
	@Autowired
	ForumBeanDAOImpl fBDI;
	
	public ForumBeanServiceImpl(ForumBeanDAOImpl fBDI) {
		this.fBDI = fBDI;
	}
	
	@Override
	public ForumBean insert(ForumBean fBean) {
		
		return fBDI.insert(fBean);
		
	}

	@Override
	public ForumBean select(Integer contentId) {
		
		return fBDI.select(contentId);
	}

	@Override
	public List<ForumBean> selectAll(Integer contentId) {
		
		return fBDI.selectAll(contentId);
	}

	@Override
	public ForumBean update(Integer contentId, String contentTitle, String contentLatestUpdate) {
		
		return fBDI.update(contentId, contentTitle, contentLatestUpdate);
	}

	@Override
	public boolean delete(Integer contentId) {
		
		return fBDI.delete(contentId);
	}
	
	

}
