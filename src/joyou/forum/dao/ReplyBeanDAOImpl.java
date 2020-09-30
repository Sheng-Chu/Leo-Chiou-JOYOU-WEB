package joyou.forum.dao;

import java.sql.Date;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import joyou.forum.model.ReplyBean;
import joyou.util.HibernateUtil;

	@Repository
	public class ReplyBeanDAOImpl implements ReplyBeanDAO {

		public ReplyBeanDAOImpl() {

		}

		@Autowired
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();;

		@Autowired
		public ReplyBeanDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		}

		@Override
		public ReplyBean reply(ReplyBean rBean) {
			Session session = sessionFactory.getCurrentSession();

			if (rBean != null) {
				session.save(rBean);
				return rBean;
			}	
			return null;
		}

		@Override
		public ReplyBean select(Integer replyId) {
			Session session = sessionFactory.getCurrentSession();
			return session.get(ReplyBean.class, replyId);
		}

		@SuppressWarnings("unchecked")
		@Override
		public List<ReplyBean> selectAll() {
			Session session = sessionFactory.getCurrentSession();
			List<ReplyBean> list = session.createQuery("From ReplyBean").getResultList();
			return list;
		}

		@Override
		public ReplyBean update(Integer replyId, String replyContent, String replyDate) {
			Session session = sessionFactory.getCurrentSession();
			ReplyBean replyBean = session.load(ReplyBean.class, replyId);

			if (replyBean != null) {
				replyBean.setReplyContent(replyContent);
				replyBean.setReplyDate(replyDate);;
			}

			return replyBean;
		}

		@Override
		public boolean delete(Integer replyId) {
			Session session = sessionFactory.getCurrentSession();
			ReplyBean replyBean = session.load(ReplyBean.class, replyId);

			if (replyBean != null) {
				session.delete(replyBean);
				return true;
			}

			return false;
		}
		
		
	}

