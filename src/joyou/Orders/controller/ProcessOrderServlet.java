package joyou.Orders.controller;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.Orders.dao.OrdersDao;
import joyou.Orders.model.OrderItemBean;
import joyou.Orders.model.OrdersBean;
import joyou.Products.dao.ProductsDao;
import joyou.Shopping.ShoppingCart;
import joyou.util.HibernateUtil;


//若刷卡成功進行結帳
@WebServlet("/ProcessOrderServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ProcessOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int amount;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);	
		
	}
	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		
		ShoppingCart sc = (ShoppingCart) request.getSession().getAttribute("ShoppingCart");
				
		if (sc == null) {
			response.sendRedirect(getServletContext().getContextPath() + "/ShoppingPage.jsp"  );
			return;
		}
		
		Integer total = sc.getSubtotal();
				
		
		int mId=(int) request.getSession().getAttribute("memberID");
		
		String recievename = (String) request.getSession().getAttribute("receivername");
		String recievephone = (String) request.getSession().getAttribute("receiverphone");
		String address = (String) request.getSession().getAttribute("address");
		
		Date today = new Date();
		String card = "信用卡付款"; //專案只演示信卡付款。
		String remarks = (String) request.getSession().getAttribute("remarks");	
		
		
		
		if(request.getSession().getAttribute("discode")!=null) {
			amount = (int)request.getSession().getAttribute("discode");
			total=total-amount;
		}
		
		
		OrdersBean oBean = new OrdersBean(null,mId, recievename, recievephone,
				address,total,today ,card, remarks,amount,null);
		
		Map<Integer, OrderItemBean> cart = sc.getContent();
		
		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = cart.keySet();
		for(Integer i : set) {
			OrderItemBean oib = cart.get(i);
			
			ProductsDao pDao = new ProductsDao(session);    
			//判斷庫存是否足夠後修改庫存
			if(pDao.selectbyId(oib.getProductId()).getProductStock()>=oib.getOrderitemQty()) {
				Integer newStock = pDao.selectbyId(oib.getProductId()).getProductStock() - oib.getOrderitemQty();
				pDao.selectbyId(oib.getProductId()).setProductStock(newStock);
			
			}else {
				session.getTransaction().rollback();
				response.sendRedirect(response.encodeRedirectURL ("ShoppingPage.jsp"));
			}
	
			oib.setOrdersBean(oBean);
			items.add(oib);
		}
		
		oBean.setItems(items); 
		OrdersDao oDao = new OrdersDao(session);
		oDao.insert(oBean);
		
		
		
		List<OrdersBean> allOrder = oDao.selectAll();
		request.getSession().setAttribute("OrderNum", allOrder.get(allOrder.size()-1).getOrderId());  
		request.getSession().setAttribute("discode",0); ///新增完後折扣歸0
		request.getSession().setAttribute("Cart", 0); 
		
		session.getTransaction().commit();
		
		request.getSession().removeAttribute("ShoppingCart");
		response.sendRedirect(response.encodeRedirectURL ("OrderFinish.jsp"));
		
	}


}
