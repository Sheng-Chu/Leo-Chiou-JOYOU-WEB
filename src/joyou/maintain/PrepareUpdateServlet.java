package joyou.maintain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.Products.dao.ProductsDao;
import joyou.Products.model.ProductsBean;
import joyou.util.HibernateUtil;

@WebServlet("/PrepareUpdateServlet.do")
public class PrepareUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductsBean pBean;

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
			int productId = Integer.parseInt(request.getParameter("productId"));
			ProductsDao pDao = new ProductsDao(session);
			pBean = pDao.selectbyId(productId);

			request.getSession().setAttribute("upId", pBean.getProductId());
			request.getSession().setAttribute("upName", pBean.getProductName());
			request.getSession().setAttribute("upStock", pBean.getProductStock());
			request.getSession().setAttribute("upPrice", pBean.getProductPrice());
			request.getSession().setAttribute("upIntro", pBean.getProductIntro());
			request.getSession().setAttribute("imgName", pBean.getImgName());
			request.getRequestDispatcher("WebMaintain/Products_Update.jsp").forward(request, response);
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("WebMaintain/Products_Update.jsp").forward(request, response);
			session.getTransaction().rollback();
		}
		session.close();
	}

}
