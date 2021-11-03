package joyou.friends.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;


import joyou.friends.model.FriendsBean;

@Repository("myFriendsDao")
public class FriendsDao {

	Session session;
	SessionFactory factory;

	public FriendsDao() {
	}
	
	public FriendsDao(Session session) {
		this.session=session;
	}

	public FriendsBean insert(FriendsBean fBean) { // 新增
		if (fBean != null) {
			session.save(fBean);
			return fBean;
		}
		return null;
	}
	
	public List<FriendsBean> selectAll() { // 查詢
		Query<FriendsBean> query = session.createQuery("from FriendsBean", FriendsBean.class);
		return query.list();
	}
	
	
	public Boolean delete(int friends_numbs) { // 刪除
		FriendsBean fBean = session.get(FriendsBean.class, friends_numbs);
		if (fBean != null) {
			session.delete(fBean);
			return true;
		}
		return false;
	}
	
	public List<FriendsBean> getFriends_numbsbymemberId(int memberId) { // 依ID查詢
		Query<FriendsBean> fBean = session.createQuery("from FriendsBean  WHERE memberId=:memberId", FriendsBean.class);
		fBean.setParameter("memberId", memberId);
		List<FriendsBean> friendList  = fBean.getResultList();
		System.out.println("666661"+fBean);
		System.out.println("666662"+friendList);
		for(FriendsBean friend:friendList) {
			System.out.println("666663"+friend.getFriends_numbs()+","+friend.getMemberId()+","+friend.getFriendId());
		}
		return friendList;
	
	}


}
