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

@WebServlet("/GetSepcailProductsServlet.do")
@javax.servlet.annotation.MultipartConfig
public class GetSepcailProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<ProductsBean> result;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		ProductsDao pDao = new ProductsDao(session);
		Integer pageNo = 1;
		Integer totalPage = 1;
		String pageNoStr = request.getParameter("pageNo");
	    
		
		 if (pageNoStr != null) {
		    	try {
		    		pageNo = Integer.parseInt(pageNoStr.trim());
		    	} catch(Exception e) {
		    		e.printStackTrace();
		    	}
		    }

		if (request.getParameter("gmaeType") != null) {
			result = pDao.selectGameType(Integer.parseInt(request.getParameter("gmaeType")));

		} else if (request.getParameter("color") != null) {
			result = pDao.selectColor(request.getParameter("color"));

		} else if (request.getParameter("min") != null) {
			String minStr = request.getParameter("min").replace("$", "");
			String maxStr = request.getParameter("max").replace("$", "");

			result = pDao.selectPriceColor(Integer.parseInt(minStr), Integer.parseInt(maxStr));

		} else if (request.getParameter("painting") != null) {
			result = pDao.selectPainting(request.getParameter("painting"));
		}

		if(result.size()>9) {
			totalPage++;
			if(result.size()>18) {
				totalPage++;
			}
		}
		
		System.out.println("totalPage:"+totalPage);
		PrintWriter out = response.getWriter();

		Gson gs = new Gson();
		String jsonPt = gs.toJson(result);

		out.write(jsonPt);
		out.write("&&&");

		Map<String, Integer> map = new HashMap<>(); // 放置頁碼訊息

		map.put("totalPage", totalPage);
		map.put("currPage", pageNo);

		out.write(gs.toJson(map));

		session.getTransaction().commit();
		out.close();

	}

}
