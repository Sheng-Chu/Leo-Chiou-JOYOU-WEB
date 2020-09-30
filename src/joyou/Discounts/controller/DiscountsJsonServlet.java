package joyou.Discounts.controller;

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
import joyou.Discounts.model.DiscountsBean;
import joyou.Discounts.model.DiscountsDao;
import joyou.util.HibernateUtil;

@WebServlet("/DiscountsJsonServlet.do")
@javax.servlet.annotation.MultipartConfig
public class DiscountsJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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

		DiscountsDao dDao = new DiscountsDao(session);
		List<DiscountsBean> dBean = dDao.selectAll();
		PrintWriter out = response.getWriter();

		Gson gs = new Gson();
		String json = gs.toJson(dBean);
		out.write(json);
		session.getTransaction().commit();
		out.close();

	}

}
