package joyou.Members.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class MembersBeanDao
{

	private SessionFactory factory;
	private Session session;
	public static final int RECORDS_PER_PAGE = 9;
	private int totalPages;

	public void setSession(Session session)
	{
		this.session = session;
	}

	public MembersBeanDao()
	{
	}

	public MembersBeanDao(Session session)
	{
		this.session = session;
	}

	public MembersBean getMemberById(Integer id)
	{
		if (id != null)
		{
			MembersBean bean = session.get(MembersBean.class, id);
			return bean;
		}
		return null;
	}

	public MembersBean getMemberByAccount(String account)
	{
		String hqlStr = "FROM MembersBean WHERE account=:acc";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("acc", account);
		MembersBean resultAccount = query.uniqueResult();
		return resultAccount;
	}

	public MembersBean getMemberByAccountPassword(String account, String password)
	{
		String hqlStr = "FROM MembersBean WHERE account=:acc AND password=:pwd";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("acc", account);
		query.setParameter("pwd", password);
		MembersBean resultAccount = query.uniqueResult();
		return resultAccount;
	}

	public MembersBean getMemberByMail(String mail)
	{
		String hqlStr = "FROM MembersBean WHERE mail=:mailbox";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("mailbox", mail);
		MembersBean resultAccount = query.uniqueResult();
		return resultAccount;
	}

	public List<MembersBean> getAllMembers()
	{
		String hqlStr = "FROM MembersBean";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		List<MembersBean> list = query.getResultList();
		return list;
	}

	public List<MembersBean> getMembersByPreferGameType(Integer gameTypeID)
	{
		String hqlStr = "FROM MembersBean WHERE preferGameType=:gameType";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("gameType", gameTypeID);
		List<MembersBean> list = query.getResultList();
		return list;
	}

	public void insertMember(MembersBean mBean)
	{
		session.save(mBean);
	}

	public void updateMember(MembersBean mBean)
	{
		MembersBean originBean = getMemberByAccount(mBean.getAccount());
		if (mBean.getPassword() == null)
		{
			System.out.println("getPassword == null");
			originBean.setNickName(mBean.getNickName());
			originBean.setTrueName(mBean.getTrueName());
			originBean.setPhone(mBean.getPhone());
			originBean.setGender(mBean.getGender());
			originBean.setPreferGameType(mBean.getPreferGameType());
			originBean.setImageFileName(mBean.getImageFileName());
		} else
		{
			System.out.println("getPassword != null");
			originBean.setPassword(mBean.getPassword());
		}
		session.save(originBean);
	}

	public void deleteMember(MembersBean mBean)
	{
		session.delete(mBean);
	}

	// 查足跡
	public String selectUserFoot(int id)
	{
		Session session = factory.getCurrentSession();
		String hqlStr = "FROM MembersBean WHERE id=:id";
		String f1 = "";
		MembersBean m = (MembersBean) session.createQuery(hqlStr).setParameter("id", id).getSingleResult();
		f1 = m.getUserfoot();

		return f1;

	}

	// 複寫足跡
	public void setUserFoot(int id, String f1)
	{
		Session session = factory.getCurrentSession();
		String hql = "update MembersBean m set m.memberUserfoot=:userfoot where m.memberID=:id";
		Query<MembersBean> query = session.createQuery(hql, MembersBean.class);

		query.setParameter("userfoot", f1);

		query.setParameter("id", id);

		query.executeUpdate();
	}

	// 桑基圖
	public List<String> findAllUserFeet()
	{
		Session session = factory.getCurrentSession();
		String hql = "select memberUserfoot FROM MembersBean";
		Query query = session.createQuery(hql);
		List<String> list = query.list();
		return list;
	}

	// ====================for members_maintain====================

	// 計算頁數
	public List<MembersBean> selectByPage(int page)
	{
		Query<MembersBean> query = session.createQuery("from MembersBean", MembersBean.class);
		List<MembersBean> beanList = query.list();
		List<MembersBean> newlist = new ArrayList<>();
		for (int i = 9 * (page - 1); i <= 8 + 9 * (page - 1) && i < beanList.size(); i++)
		{
			newlist.add(beanList.get(i));
		}
		return newlist;

	}

	// 計算頁數(無條件進位)
	public int getTotalPages()
	{
		totalPages = (int) (Math.ceil(getMembersCounts() / (double) RECORDS_PER_PAGE));
		return totalPages;
	}

	// 計算會員人數
	public long getMembersCounts()
	{
		long count = 0;
		Query<MembersBean> query = session.createQuery("from MembersBean", MembersBean.class);
		List<MembersBean> beanList = query.list();
		for (MembersBean bBean : beanList)
		{
			count++;
		}
		System.out.println("會員人數:" + count);
		return count;
	}

	// 帳號由A-Z
	public List<MembersBean> selectMemberAsc(int page)
	{
		Query<MembersBean> query = session.createQuery("from MembersBean order by memberAccount asc",
				MembersBean.class);
		List<MembersBean> beanList = query.list();
		List<MembersBean> newlist = new ArrayList<>();
		for (int i = 9 * (page - 1); i < 8 + 9 * (page - 1) + 1 && i < beanList.size(); i++)
		{

			newlist.add(beanList.get(i));
		}
		return newlist;

	}

	// 帳號由Z-A
	public List<MembersBean> selectMemberDesc(int page)
	{
		Query<MembersBean> query = session.createQuery("from MembersBean order by memberAccount desc ",
				MembersBean.class);
		List<MembersBean> beanList = query.list();
		List<MembersBean> newlist = new ArrayList<>();
		for (int i = 9 * (page - 1); i <= 8 + 9 * (page - 1) && i < beanList.size(); i++)
		{
			newlist.add(beanList.get(i));
		}
		return newlist;

	}

	// 刪除
	public boolean delete(int memberID)
	{
		MembersBean mBean = session.get(MembersBean.class, memberID);
		if (mBean != null)
		{
			session.delete(mBean);
			return true;
		}
		return false;
	}

}