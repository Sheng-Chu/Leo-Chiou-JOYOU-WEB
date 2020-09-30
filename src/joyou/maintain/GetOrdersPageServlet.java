package joyou.maintain;

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
import joyou.Products.dao.ProductsDao;
import joyou.Products.model.ProductsBean;
import joyou.util.HibernateUtil;

@WebServlet("/GetPageNumberServlet.do")
@javax.servlet.annotation.MultipartConfig
public class GetOrdersPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<ProductsBean> list;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		ProductsDao pDao = new ProductsDao(session);
	    Integer pageNo = 1;
	    Integer totalPage = 1;
	    String pageNoStr = request.getParameter("pageNo");
	    String totalPageStr = request.getParameter("totalPage");
	    String type = request.getParameter("type");
	    if (pageNoStr != null) {
	    	try {
	    		pageNo = Integer.parseInt(pageNoStr.trim());
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    }else {
	    	pageNo=1;
	    }

	    if (totalPageStr != null) {     		
	    	try {
	    		totalPage = Integer.parseInt(totalPageStr.trim());
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    		totalPage = pDao.getTotalPages();
	    	}
	    } else {
	    	totalPage = pDao.getTotalPages();
	    }
		try(
			PrintWriter out = response.getWriter();
		) {
			if(type.equals("all")) {
	    		list = pDao.selectByPage(pageNo);
	    		
	    	}else if(type.equals("desc")) {  
	    		list=pDao.selectPriceDesc(pageNo);
	    		
	    		
	    	}else if(type.equals("asc")) {
	    		list=pDao.selectPriceAsc(pageNo);
	    	}
			
//			list =pDao.selectByPage(pageNo);
			Gson gson = new Gson();
			String categoriesJson = gson.toJson(list); 
            out.write(categoriesJson);
            out.write("&&&");
            Map<String, Integer>  map = new HashMap<>();
            map.put("totalPage", totalPage);
            map.put("currPage", pageNo);
            out.write(gson.toJson(map));
            
            session.getTransaction().commit();
            out.close();
            
		} 
	}
}
