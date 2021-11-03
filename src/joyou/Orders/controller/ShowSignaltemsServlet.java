package joyou.Orders.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import joyou.Orders.dao.OrderItemDao;
import joyou.Orders.model.OrderItemBean;
import joyou.util.HibernateUtil;

//查詢訂單細項

@WebServlet("/ShowSignaltemsServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ShowSignaltemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<OrderItemBean> orderItems;
	private PrintWriter out;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		try {
			OrderItemDao oIDao = new OrderItemDao(session);
			Integer orderId = (int) request.getSession().getAttribute("OrderNum");	
			
			orderItems = oIDao.selectByOrderId(orderId);
			
			out = response.getWriter();

		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		
		Gson gs = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String jsonPt = gs.toJson(orderItems);
        out.write(jsonPt);
        
        
		session.getTransaction().commit();
		out.close();
		
	}
}
