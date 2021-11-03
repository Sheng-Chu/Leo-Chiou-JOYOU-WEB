package joyou.Members.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanService;
import joyou.util.HibernateUtil;

@WebServlet("/GetAllMemberPictureServlet")
public class GetAllMemberPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();

		MembersBeanService mService = new MembersBeanService(session);
		List<MembersBean> beanList = mService.getAllMembers();
		HashMap<Integer, String> result = new HashMap<Integer, String>();
		for (MembersBean mBean : beanList) {
			result.put(mBean.getId(), mBean.getImageFileName());
		}

		tx.commit();
		out.write(new Gson().toJson(result));
		out.close();
	}

}
