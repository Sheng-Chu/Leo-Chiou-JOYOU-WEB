package joyou.maintain;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.Orders.dao.OrderItemDao;
import joyou.Orders.dao.OrdersDao;
import joyou.util.HibernateUtil;


@WebServlet("/OrdersDeleteServlet.do")
@javax.servlet.annotation.MultipartConfig
public class OrdersDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		
		int oId = Integer.parseInt(request.getParameter("OrderId"));
		OrderItemDao oiDao = new OrderItemDao(session);
		oiDao.delete(oId);
		
		OrdersDao oDao = new OrdersDao(session);
		boolean result = oDao.delete(oId);
		
		
		if(result) {
			request.setAttribute("DeleteMsg", "Delete Success!");
		}else {
			request.setAttribute("DeleteMsg", "Delete UnSuccess!");
		}
		
        session.getTransaction().commit();
        
        
	}

}
