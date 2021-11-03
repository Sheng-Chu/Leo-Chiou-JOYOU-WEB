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

@WebServlet("/CheckDuplicateMailServlet")
public class CheckDuplicateMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	@RequestMapping(value = "/CheckDuplicateMail", method = RequestMethod.POST)
//	public @ResponseBody Map<String, String> CheckDuplicateMail(@RequestParam(value = "mail") String memberMail) {
//		System.out.println("==============");
//		System.out.println("mail=" + memberMail);
//		Map<String, String> map = new HashMap<>();
//		MembersBeanService mService = new MembersBeanService();
//		boolean result2 = mService.checkMemberExistByMail(memberMail);
//		map.put("memberMailisDuplicate", Boolean.toString(result2));
//		return map;
//	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String memberMail = request.getParameter("mail");

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		Gson gson = new Gson();
		Map<String, String> map = new HashMap<>();
		if (memberMail != null && memberMail.length() != 0) {

			SessionFactory factory = HibernateUtil.getSessionFactory();
			Session session = factory.getCurrentSession();
			Transaction tx = session.beginTransaction();

			MembersBeanService mService = new MembersBeanService(session);
			boolean result2 = mService.checkMemberExistByMail(memberMail);
			map.put("memberMailisDuplicate", Boolean.toString(result2));

			tx.commit();

		}
		out.println(gson.toJson(map));
		out.close();
	}

}
