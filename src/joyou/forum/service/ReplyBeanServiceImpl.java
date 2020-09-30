package joyou.forum.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;


import joyou.forum.dao.ReplyBeanDAOImpl;

import joyou.forum.model.ReplyBean;

@Service
@Transactional
@EnableTransactionManagement
public class ReplyBeanServiceImpl implements ReplyBeanService{
	
	@Autowired
	ReplyBeanDAOImpl rBDI;
	
	public ReplyBeanServiceImpl(ReplyBeanDAOImpl rBDI) {
		this.rBDI = rBDI;
	}
	
	@Override
	public ReplyBean reply(ReplyBean rBean) {
		
		return rBDI.reply(rBean);
		
	}

	@Override
	public ReplyBean select(Integer replyId) {
		
		return rBDI.select(replyId);
	}

	@Override
	public List<ReplyBean> selectAll(Integer replyId) {
		
		return rBDI.selectAll(replyId);
	}

	@Override
	public ReplyBean update(Integer replyId, String replyContent, String replyDate) {
		
		return rBDI.update(replyId, replyContent, replyDate);
	}

	@Override
	public boolean delete(Integer replyId) {
		
		return rBDI.delete(replyId);
	}
	
	

}


