package joyou.Discounts.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.Discounts.model.DiscountsBean;
import joyou.Discounts.model.DiscountsDao;
import joyou.util.HibernateUtil;

@WebServlet("/PrepareDiscountUpdateServlet.do")
public class PrepareDiscountUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		try {
			int Id = Integer.parseInt(request.getParameter("discountid"));
			DiscountsDao dDao = new DiscountsDao(session);
			DiscountsBean bean = dDao.selectbyId(Id);
			
			request.getSession().setAttribute("updiscountid", bean.getDicountId());
			request.getSession().setAttribute("upCode", bean.getCode());
			request.getSession().setAttribute("upAmount", bean.getAmount());
			request.getSession().setAttribute("upCondition", bean.getCondition());

			
			request.getRequestDispatcher("WebMaintain/Discounts_Update.jsp").forward(request, response);
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("WebMaintain/Discounts_Update.jsp").forward(request, response);
			session.getTransaction().rollback();
		}
		session.close();
	}

}
