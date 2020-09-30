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
import joyou.Orders.model.OrderItemBean;
import joyou.Products.dao.ProductsDao;
import joyou.Products.model.ProductsBean;
import joyou.Shopping.ShoppingCart;
import joyou.util.HibernateUtil;


//加入購物車
@WebServlet("/BuyProductsJsonServlet.do")
@javax.servlet.annotation.MultipartConfig
public class BuyProductsJsonServlet  extends HttpServlet{
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
			request.getSession().setAttribute("ShoppingCart", cart);   
		}
			
		String pageNo = request.getParameter("pageNo");
		String countsStr = request.getParameter("counts");
		
		
		ProductsDao pDao = new ProductsDao(session);
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		ProductsBean pBean = pDao.selectbyId(productId);

		String productName = pBean.getProductName();
		int productPrice = pBean.getProductPrice();
		String productLang = pBean.getProductLang();
		String imgName = pBean.getImgName();
		
		
		if (pageNo == null || pageNo.trim().length() == 0){
			pageNo = (String) request.getSession().getAttribute("pageNo") ;
			if (pageNo == null){
			   pageNo = "1";
			}
		} 
		
		
		
		int counts = 0 ; 
		int totalPrice= 0 ;
		
		
		try{
		counts=Integer.parseInt(countsStr);
		totalPrice=productPrice*counts;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		OrderItemBean oiBean = new OrderItemBean(productId,productName,productPrice,productLang,
				counts,totalPrice,imgName);
		
		cart.addToCart(productId, oiBean);	
		
		
		
		Map<String, String> map = new HashMap<>();
		PrintWriter out = response.getWriter();
		map.put("num", Integer.toString(cart.getItemNumber()));
		map.put("total", Integer.toString(cart.getSubtotal()));
		session.getTransaction().commit();
		
		
		Gson gson = new Gson();
		out.println(gson.toJson(map));
	
	
		out.close();
		
	}
}
