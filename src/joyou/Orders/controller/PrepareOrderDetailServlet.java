package joyou.Orders.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.util.HibernateUtil;


@WebServlet("/PrepareOrderDetailServlet.do")
@javax.servlet.annotation.MultipartConfig
public class PrepareOrderDetailServlet extends HttpServlet {
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
		
		int Id = Integer.parseInt(request.getParameter("OrderId"));
		System.out.println("&&&&&&&&&&&"+Id);
		request.getSession().setAttribute("OrderNum", Id);
		response.sendRedirect(response.encodeRedirectURL ("OrderDetail.jsp"));
		
		session.getTransaction().commit();
	}

}
