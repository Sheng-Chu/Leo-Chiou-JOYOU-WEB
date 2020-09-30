package joyou.GameTypes.dao;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import joyou.GameTypes.model.GameTypesBean;

@Repository("myGameTypesDao")
public class GameTypesDao {

	Session session;

	public GameTypesDao(Session session) {
		this.session = session;
	}
	
	public GameTypesDao() {
	}
	
	public String getGameTypeId(int id) {
		System.out.println(22);
		String hqlStr = "from GameTypesBean where gametypeId=:typeid";
		Query<GameTypesBean> query = session.createQuery(hqlStr, GameTypesBean.class);
		query.setParameter("typeid", id);
		GameTypesBean a = query.uniqueResult();
		String name = a.getGametypeName();
		return name;
	}
}
