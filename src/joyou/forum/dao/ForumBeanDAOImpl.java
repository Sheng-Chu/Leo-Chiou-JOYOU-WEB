package joyou.forum.dao;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import joyou.Orders.model.OrderItemBean;
import joyou.forum.model.ForumBean;
import joyou.forum.model.ReplyBean;
import joyou.util.HibernateUtil;


public class ForumBeanDAOImpl implements ForumBeanDAO{
	
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	
	public ForumBeanDAOImpl() {
	}

	public ForumBeanDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public ForumBean insert(ForumBean fBean) {
		Session session = sessionFactory.getCurrentSession();

		if (fBean != null) {
			session.save(fBean);
			return fBean;
		}	
		return null;
	}
	

	public ForumBean select(Integer contentId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ForumBean.class, contentId);
	}

	@SuppressWarnings("unchecked")
	public List<ForumBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		List<ForumBean> list = session.createQuery("From ForumBean").getResultList();
		System.out.println(list);
		return list;
	}

	public ForumBean update(Integer contentId, String contentTitle, String contentLatestUpdate) {
		Session session = sessionFactory.getCurrentSession();
		ForumBean forumBean = session.load(ForumBean.class, contentId);

		if (forumBean != null) {
			forumBean.setContentTitle(contentTitle);
			forumBean.setContentLatestUpdate(contentLatestUpdate);
		}

		return forumBean;
	}

	public boolean delete(Integer contentId) {
		Session session = sessionFactory.getCurrentSession();
		ForumBean forumBean = session.load(ForumBean.class, contentId);

		if (forumBean != null) {
			session.delete(forumBean);
			return true;
		}

		return false;
	}
	

}



