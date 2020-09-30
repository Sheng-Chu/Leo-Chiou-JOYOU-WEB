package joyou.Discounts.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.Discounts.model.DiscountsDao;
import joyou.util.HibernateUtil;


@WebServlet("/DeleteDiscountsServlet.do")
public class DiscountsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		
		try {
		int id = Integer.parseInt(request.getParameter("discountId"));
		DiscountsDao dDao = new DiscountsDao(session);
		dDao.delete(id);
		
		
		}catch(Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
		session.getTransaction().commit();
		
	}

}
