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

	@Repository
	public class ReplyBeanDAOImpl implements ReplyBeanDAO {

		private Session session;

		public ReplyBeanDAOImpl() {

		}
		
		public ReplyBeanDAOImpl(Session session) {
			this.session=session;
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

		
		
		@Override
		public List<ReplyBean> selectByContentId(Integer contentId){  //依文章ID查詢
			Session session = sessionFactory.getCurrentSession();
			Query<ReplyBean> query = session.createQuery("from ReplyBean where contentId=:id", ReplyBean.class);
			query.setParameter("id", contentId);	
			List<ReplyBean> list = query.list();
			return list;
			
		}
		
		@Override
		public ReplyBean update(Integer replyId, String replyContent) {
			Session session = sessionFactory.getCurrentSession();
			ReplyBean replyBean = session.get(ReplyBean.class, replyId);
			if(replyBean != null) {
				replyBean.setReplyContent(replyContent);
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
		
		@Override
		public ReplyBean update2(Integer replyId, Integer replyL) {
			Session session = sessionFactory.getCurrentSession();
			ReplyBean replyBean = session.get(ReplyBean.class, replyId);
			return replyBean;
		}
		
	}

