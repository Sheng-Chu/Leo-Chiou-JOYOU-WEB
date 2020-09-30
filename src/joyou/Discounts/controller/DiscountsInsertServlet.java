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

import joyou.Discounts.model.DiscountsBean;
import joyou.Discounts.model.DiscountsDao;
import joyou.util.HibernateUtil;


@WebServlet("/InsertDiscountsServlet.do")
public class DiscountsInsertServlet extends HttpServlet {
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
		String code = request.getParameter("code");
		String amount = request.getParameter("amount");
		String condition = request.getParameter("condition");
		DiscountsBean dBean = new DiscountsBean(code, amount, condition);
		DiscountsDao dDao = new DiscountsDao(session);
		dDao.insert(dBean);
		
		out = response.getWriter();
		map.put("DisInsertMsg", "新增成功");
		
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
