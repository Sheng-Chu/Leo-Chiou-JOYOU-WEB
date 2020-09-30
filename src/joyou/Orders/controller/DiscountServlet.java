package joyou.Orders.controller;

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
import joyou.Shopping.ShoppingCart;
import joyou.util.HibernateUtil;


//輸入折扣碼後執行
@WebServlet("/DiscountServlet.do")
@javax.servlet.annotation.MultipartConfig
public class DiscountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Session session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String code = request.getParameter("code");
		response.setContentType("application/json; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();

		PrintWriter out = response.getWriter();
		ShoppingCart sc = (ShoppingCart) request.getSession().getAttribute("ShoppingCart");

		if (sc == null) {
			response.sendRedirect(getServletContext().getContextPath() // 購物車沒商品
					+ "/ShoppingPage.jsp");
			return;
		}

		Integer subtotal = sc.getSubtotal();
		String totalStr = Integer.toString(subtotal);

		DiscountsDao dDao = new DiscountsDao(session);
		boolean a = dDao.checkCode(code);

		DiscountsBean dBean = dDao.selectByCode(code);

		Map<String, String> map = new HashMap<>();
		if (dBean != null) {

			try {
				int cdn = Integer.parseInt(dBean.getCondition());
				if (a != false && subtotal > cdn) {   //判斷消費金額是否符合
					int discode = 0;
					discode = Integer.parseInt(dBean.getAmount());  //取得折扣的金額
					
					
					Integer newtotal = sc.getNewSubtotal(subtotal, discode);  
					request.getSession().setAttribute("newsubtotal", newtotal);  
					request.getSession().setAttribute("discode", discode);
					
					
					String discodeStr = Integer.toString(discode);
					String newtotalStr = Integer.toString(newtotal);
					
					map.put("newTotal", newtotalStr);
					map.put("codeMsg", "折抵成功");
					map.put("amount", discodeStr);

				} else {
					map.put("codeMsg", "消費金額不足");
					map.put("amount", "0");
					map.put("newTotal",totalStr);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else {
			map.put("codeMsg", "折扣碼不存在");
			map.put("amount", "0");
			map.put("newTotal",totalStr);
		}

		session.getTransaction().commit();
		Gson gson = new Gson();
		out.println(gson.toJson(map));
		out.close();

	}
}
