package joyou.Members.model;

import java.util.List;

import org.hibernate.Session;

public class MembersBeanService {

	private MembersBeanDao memberDao;

	public MembersBeanService() {
	}

	public MembersBeanService(Session session) {
		this.memberDao = new MembersBeanDao(session);
	}

	public boolean checkMemberExistByAccount(String account) {
		if (account != null && account.length() != 0) {
			MembersBean resultAccount = memberDao.getMemberByAccount(account);
			if (resultAccount != null) {
				return true;
			}
		}
		return false;
	}

	public boolean checkMemberExistByMail(String mail) {
		if (mail != null && mail.length() != 0) {
			MembersBean resultAccount = memberDao.getMemberByMail(mail);
			if (resultAccount != null) {
				return true;
			}
		}
		return false;
	}

	public MembersBean getMemberByAccountPassword(String account, String password) {
		if (account != null && account.length() != 0 && password != null && password.length() != 0) {
			MembersBean resultAccount = memberDao.getMemberByAccountPassword(account, password);
			return resultAccount;
		}
		return null;
	}

	public MembersBean getMemberById(Integer id) {
		if (id != null) {
			MembersBean bean = memberDao.getMemberById(id);
			return bean;
		}
		return null;
	}

	public MembersBean getMemberByAccount(String account) {
		if (account != null && account.length() != 0) {
			MembersBean bean = memberDao.getMemberByAccount(account);
			return bean;
		}
		return null;
	}
	

	public List<MembersBean> getAllMembers() {
		return memberDao.getAllMembers();
	}

	public List<MembersBean> getMembersByPreferGameType(Integer gameTypeID) {
		return memberDao.getMembersByPreferGameType(gameTypeID);
	}

	public boolean insert(MembersBean bean) {
		if (bean != null && !checkMemberExistByAccount(bean.getAccount())) {
			memberDao.insertMember(bean);
			return true;
		}
		return false;
	}

	public boolean update(MembersBean bean) {
		System.out.println("account=  " + bean.getAccount());
		if (bean != null && checkMemberExistByAccount(bean.getAccount())) {
			memberDao.updateMember(bean);
			return true;
		}
		return false;
	}

	public boolean delete(MembersBean bean) {
		if (checkMemberExistByAccount(bean.getAccount())) {
			memberDao.deleteMember(bean);
			return true;
		}
		return false;
	}

}
