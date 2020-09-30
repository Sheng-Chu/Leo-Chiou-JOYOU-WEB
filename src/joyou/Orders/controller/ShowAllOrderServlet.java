package joyou.Orders.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import joyou.Orders.dao.OrdersDao;
import joyou.Orders.model.OrdersBean;
import joyou.util.HibernateUtil;

//查詢訂單明細資料

@WebServlet("/ShowAllOrderServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ShowAllOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Object> dateList;

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
			Integer memberId = (int) request.getSession().getAttribute("memberID");
			
			List<OrdersBean> oBean = oDao.selectbyMemberId(memberId);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			dateList = new ArrayList<>();
			for(OrdersBean a :oBean) {
				String date = sdf.format(a.getOrderDate());
				dateList.add(date);
			}
			
			PrintWriter out = response.getWriter();
				
			Gson gs = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
			out.println(gs.toJson(oBean));
			out.println("&&&&&");
			out.println(gs.toJson(dateList));
			out.close();


		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		session.getTransaction().commit();
 
	}

}
