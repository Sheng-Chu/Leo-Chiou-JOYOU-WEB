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

import com.google.gson.Gson;

import joyou.util.HibernateUtil;

@WebServlet("/SendVerifiedMailServlet")
public class SendVerifiedMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Session session;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mailAddress = request.getParameter("mail");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		Gson gson = new Gson();
		Map<String, String> map = new HashMap<>();

		try {
			SessionFactory factory = HibernateUtil.getSessionFactory();

			session = factory.openSession();
			session.beginTransaction();

			map.put("verifiedCode", new TestMail().sendMail(mailAddress));

			session.getTransaction().commit();
			session.close();

			out.println(gson.toJson(map));
			out.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
