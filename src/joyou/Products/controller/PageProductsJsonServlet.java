package joyou.Products.controller;

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


@WebServlet("/PageProductsJsonServlet.do")
@javax.servlet.annotation.MultipartConfig
public class PageProductsJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<ProductsBean> pPt;
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
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
	    
	    
	    try(PrintWriter out = response.getWriter()){
	    	
	    	if(type.equals("all")) {
	    		pPt = pDao.selectByPage(pageNo);
	    		
	    	}else if(type.equals("desc")) {  
	    		pPt=pDao.selectPriceDesc(pageNo);
	    		
	    	}else if(type.equals("asc")) {
	    		pPt=pDao.selectPriceAsc(pageNo);
	    		
	    	}
	    	
	    	
	    	
	    	
			Gson gs = new Gson();
			String jsonPt = gs.toJson(pPt);
			
            out.write(jsonPt);
            out.write("&&&");
            Map<String, Integer>  map = new HashMap<>();
            map.put("totalPage", totalPage);
            map.put("currPage", pageNo);
            out.write(gs.toJson(map));
            session.getTransaction().commit();
            out.close();
	    }

	    
	}

}
