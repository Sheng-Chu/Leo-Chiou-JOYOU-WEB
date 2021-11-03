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

import joyou.Products.dao.ProductsDao;
import joyou.Products.model.ProductsBean;
import joyou.util.HibernateUtil;

//進入購物頁面準備商品資料
@WebServlet("/ProductsGetServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ProductsGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int pageNo;
      

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		
		try {
		String pageStr = request.getParameter("pageNo");
		if(pageStr==null) {
			pageNo=1;
		}else {
			pageNo = Integer.parseInt(pageStr.trim());
		}
		
		ProductsDao pDao = new ProductsDao(session);
		List<ProductsBean> pageBean = pDao.selectByPage(pageNo); 
		
		int totalNo = pDao.getTotalPages();
		request.setAttribute("products_DPP", pageBean);    
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("totalPages", totalNo);
		request.getRequestDispatcher("ShoppingPage.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.getTransaction().commit();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
