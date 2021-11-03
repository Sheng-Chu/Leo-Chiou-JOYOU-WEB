package joyou.Orders.controller;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.Orders.model.OrderItemBean;
import joyou.Shopping.ShoppingCart;
import joyou.util.HibernateUtil;


//加入購物車
@WebServlet("/BuyProductsServlet.do")
@javax.servlet.annotation.MultipartConfig
public class BuyProductsServlet  extends HttpServlet{
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			processAction(request,response);
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			processAction(request,response);
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}


	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		ShoppingCart cart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
		
		if (cart == null) {
			cart = new ShoppingCart();
			request.getSession(false).setAttribute("ShoppingCart", cart);   
		}
		
		String productIdStr = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String productPriceStr = request.getParameter("productPrice");
		String productLang = request.getParameter("productLang");
		String pageNo = request.getParameter("pageNo");
		String countsStr = request.getParameter("counts");
		String imgName = request.getParameter("imgName");
		
		
		if (pageNo == null || pageNo.trim().length() == 0){
			pageNo = (String) request.getSession().getAttribute("pageNo") ;
			if (pageNo == null){
			   pageNo = "1";
			}
		} 
		
		
		
		int counts = 0 ; 
		int productId = 0 ;
		int productPrice = 0 ;
		int totalPrice= 0 ;
		
		
		try{
		counts=Integer.parseInt(countsStr);
		productId=Integer.parseInt(productIdStr);
		productPrice=Integer.parseInt(productPriceStr);
		totalPrice=productPrice*counts;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		OrderItemBean oiBean = new OrderItemBean(productId,productName,productPrice,productLang,
				counts,totalPrice,imgName);
		
		cart.addToCart(productId, oiBean);
		
		session.getTransaction().commit();
		
		RequestDispatcher rd = request.getRequestDispatcher("/SaleProductsGetServlet.do");
		rd.forward(request, response);
		
		
		
	}
}
