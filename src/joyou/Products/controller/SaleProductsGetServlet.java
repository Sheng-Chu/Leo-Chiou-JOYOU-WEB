package joyou.Products.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import joyou.Members.model.MembersBeanDao;
import joyou.Products.dao.ProductsDao;
import joyou.Products.model.ProductsBean;
import joyou.util.HibernateUtil;

@WebServlet("/SaleProductsGetServlet.do")
@javax.servlet.annotation.MultipartConfig
public class SaleProductsGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		try {
			if(request.getSession().getAttribute("memberID")==null) {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			
			int mid = (int) request.getSession().getAttribute("memberID");
			ProductsDao pDao = new ProductsDao(session);
			List<ProductsBean> saleBean = pDao.selectSaleProduct(); // 準備特價商品

			MembersBeanDao mDao = new MembersBeanDao(session);
			Integer typeId = mDao.getMemberById(mid).getPreferGameType(); // 準備建議商品
			List<ProductsBean> suggestBean = pDao.selectSuggest(typeId);

			request.setAttribute("products_Suggest", suggestBean);
			request.setAttribute("products_Sale", saleBean);

			request.getRequestDispatcher("ShoppingPage.jsp").forward(request, response);
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
