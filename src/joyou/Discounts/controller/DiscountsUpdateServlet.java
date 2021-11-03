package joyou.Discounts.controller;

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

import joyou.Discounts.model.DiscountsDao;
import joyou.util.HibernateUtil;


@WebServlet("/UpdateDiscountsServlet.do")
public class DiscountsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processAction(request, response);
	}


	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		
		Map<String, String> map = new HashMap<>();
		
		try {
		int id = (int)request.getSession().getAttribute("updiscountid");
		String code = request.getParameter("code");
		String amount = request.getParameter("amount");
		String condition = request.getParameter("condition");
		DiscountsDao dDao = new DiscountsDao(session);
		dDao.update(id, code, amount, condition);
		
		
		out = response.getWriter();
		map.put("DisUpdateMsg", "更新成功");
		
		}catch(Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
		session.getTransaction().commit();
		Gson gson = new Gson();
		out.println(gson.toJson(map));
		out.close();
		
	}

}
