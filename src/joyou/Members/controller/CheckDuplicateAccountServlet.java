package joyou.Members.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import joyou.Members.model.MembersBeanService;
import joyou.util.HibernateUtil;

@WebServlet("/CheckDuplicateAccountServlet")
public class CheckDuplicateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String memberAccount = request.getParameter("account");

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		Gson gson = new Gson();
		Map<String, String> map = new HashMap<>();

		if (memberAccount != null && memberAccount.length() != 0) {

			SessionFactory factory = HibernateUtil.getSessionFactory();
			Session session = factory.getCurrentSession();
			Transaction tx = session.beginTransaction();

			MembersBeanService mService = new MembersBeanService(session);
			boolean result1 = mService.checkMemberExistByAccount(memberAccount);
			map.put("memberAccountisDuplicate", Boolean.toString(result1));

			tx.commit();

		}
		out.println(gson.toJson(map));
		out.close();
	}

}
