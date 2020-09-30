package joyou.Group.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import joyou.Group.dao.GroupsDao;
import joyou.Group.model.Groups;
import joyou.util.HibernateUtil;

@Repository
public class GroupsDaoImpl implements GroupsDao {

	@Autowired
	SessionFactory factory = HibernateUtil.getSessionFactory();
	Session session;
	@Override
	public Groups findByGroupId(Integer groupid) {
		Session session = factory.getCurrentSession();
		Groups groups = session.get(Groups.class, groupid);
		return groups;
	}
	
	@Override
	public int saveGroup(Groups groups) {
		int n = 0;
		boolean exist = isGroupExist(groups);
		if (exist) {
			return -1;
		}
		Session session = factory.getCurrentSession();
		try {
			session.save(groups);
			n = 1;
		} catch (Exception e) {
			n = -2;
		}
		return n;
	}

	@Override
	public void updateGroup(Groups groups) {
		Session session = factory.getCurrentSession();
		session.update(groups);

	}
	
	@Override
	public void evictGroup(Groups groups) {
		Session session = factory.getCurrentSession();
		session.evict(groups);

	}


	@SuppressWarnings("unchecked")
	public List<Groups> findAllGroups() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Groups";
		List<Groups> list = session.createQuery(hql).getResultList();
		System.out.println(list);
		return list;
	}

	@Override
	public boolean isGroupExist(Groups groups) {
		boolean exist = false;
		Session session = factory.getCurrentSession();
		String hql = "FROM Groups g WHERE g.groupId=:GroupId";
		try {
			session.createQuery(hql).setParameter("GroupId", groups.getGroupId()).getSingleResult();
			exist = true;
		} catch (NoResultException ex) {
			;
		}
		return exist;
	}

	@Override
	public Integer checkGroupId(Integer groupid) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Groups g WHERE g.groupId = :Groupid";
		String id = "";
		try {
			Groups g = (Groups) session.createQuery(hql).setParameter("Groupid", groupid).getSingleResult();
			groupid = g.getGroupId();
		} catch (NoResultException ex) {
			;
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("ErrorMsg=" + ex.getMessage());
			id = "Error: 資料庫異常，請檢查資料庫";
		}
		return groupid;
	}
}
