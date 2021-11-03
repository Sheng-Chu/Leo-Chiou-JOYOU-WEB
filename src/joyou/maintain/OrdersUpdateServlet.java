package joyou.maintain;

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
import joyou.Orders.dao.OrdersDao;
import joyou.util.HibernateUtil;

@WebServlet("/OrdersUpdateServlet.do")
@javax.servlet.annotation.MultipartConfig
public class OrdersUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		Map<String, String> map = new HashMap<>();
		
		try {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		String receiver = request.getParameter("receiver");
		String remarks = request.getParameter("remarks");
		String receiverPhone = request.getParameter("receiverPhone");
		String address = request.getParameter("address");
		OrdersDao oDao = new OrdersDao(session);
		oDao.update(orderId, receiver, receiverPhone, address, remarks);
		out = response.getWriter();
		map.put("oUpdateMsg", "更新成功");
		
		}catch(Exception e) {
			e.printStackTrace();
			map.put("oUpdateMsg", "更新失敗");
			session.getTransaction().rollback();
		}
		
		session.getTransaction().commit();
		Gson gson = new Gson();
		out.println(gson.toJson(map));
		out.close();
		
		

	}

}
