package joyou.friends.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;


import joyou.friends.model.FriendsDetailBean;

public class FriendsDetailDao {
	static Session session;
	
	public FriendsDetailDao() {
	}
	
	public FriendsDetailDao(Session session) {
		FriendsDetailDao.session=session;
	}
	

	
	public List<FriendsDetailBean> selectAll() { // 查詢
		Query<FriendsDetailBean> query = session.createQuery("from FriendsDetailBean", FriendsDetailBean.class);
		return query.list();
	}
	
	

	public FriendsDetailBean selectByFrinendId(int friendId){  //依ID查詢
	//	FriendsDetailBean fBean = session.get(FriendsDetailBean.class, friendId);
	//	return fBean;
		String hqlStr = "FROM FriendsDetailBean WHERE friendId=:friendId";;
		Query<FriendsDetailBean> query = session.createQuery(hqlStr, FriendsDetailBean.class);
		query.setParameter("friendId", friendId);	
		List<FriendsDetailBean> list = query.getResultList();
		if(list != null && list.size() > 0 ) {
			return list.get(0);		
		}else {				
			return new FriendsDetailBean();
		}
		
		
	}
}
