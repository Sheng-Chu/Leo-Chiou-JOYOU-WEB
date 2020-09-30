package joyou.Orders.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanDao;
import joyou.Orders.dao.OrdersDao;
import joyou.Orders.model.OrdersBean;
import joyou.util.HibernateUtil;

//查詢訂單明細資料

@WebServlet("/ShowSignalOrderServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ShowSignalOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		try {
			OrdersDao oDao = new OrdersDao(session);
			Integer orderId = (int) request.getSession().getAttribute("OrderNum");

			OrdersBean oBean = oDao.selectbyId(orderId);
			Integer memberId = oBean.getMemberId();
			MembersBeanDao mDao = new MembersBeanDao(session);
			MembersBean mBean = mDao.getMemberById(memberId);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = oBean.getOrderDate();
			String s = sdf.format(date);
			
			
			Map<String, String> map = new HashMap<>();
			PrintWriter out = response.getWriter();
			
			map.put("date",s);
			map.put("orderId", Integer.toString(orderId));
			map.put("remarks", oBean.getRemarks());
			map.put("pay", oBean.getPayMethod());
			map.put("amount", Integer.toString(oBean.getOrderAmount()));
			map.put("receivername", oBean.getReceiver());
			map.put("receiverphone", oBean.getReceiverPhone());
			map.put("membername", mBean.getTrueName());
			map.put("memberphone", mBean.getPhone());
			map.put("address", oBean.getShippingAddress());
			map.put("discode", Integer.toString(oBean.getDiscount()));
			
			
			Gson gson = new Gson();
			out.println(gson.toJson(map));
			out.close();


		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		session.getTransaction().commit();
 
	}

}
