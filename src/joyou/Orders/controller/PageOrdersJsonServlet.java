package joyou.Orders.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

@WebServlet("/PageOrdersJsonServlet.do")
@javax.servlet.annotation.MultipartConfig
public class PageOrdersJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<OrdersBean> orders;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		OrdersDao oDao = new OrdersDao(session);
		Integer pageNo = 1;
		Integer totalPage = 1;
		String pageNoStr = request.getParameter("pageNo");
		String totalPageStr = request.getParameter("totalPage");
		String type = request.getParameter("type");

		System.out.println("pageNoStr"+ pageNoStr);
		if (pageNoStr != null) {
			try {
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (totalPageStr != null) {
			try {
				totalPage = Integer.parseInt(totalPageStr.trim());
			} catch (Exception e) {
				e.printStackTrace();
				totalPage = oDao.getTotalPages();
			}
		} else {
			totalPage = oDao.getTotalPages();
		}

		if (type.equals("all")) {
			orders = oDao.selectByPage(pageNo);

		}
		PrintWriter out = response.getWriter();

		Gson gs = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String jsonOrders = gs.toJson(orders);
		out.write(jsonOrders);
		out.write("&&&");
		Map<String, Integer> map = new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("currPage", pageNo);
		out.write(gs.toJson(map));
		session.getTransaction().commit();
		out.close();

	}

}
