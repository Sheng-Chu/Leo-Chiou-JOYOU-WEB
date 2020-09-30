package joyou.maintain;

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
import joyou.Products.dao.ProductsDao;
import joyou.util.HibernateUtil;

@WebServlet("/ProductsCheckServlet.do")
public class ProductsCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		String Name = request.getParameter("productName");
		ProductsDao pDao = new ProductsDao(session);
		Map<String, String> map = new HashMap<>();
		if(Name==null||Name.trim().isEmpty()||Name.equals("")) {
			map.put("ptMsg", "名稱不可空白");
			
		}else if(pDao.checkName(Name)) {
			map.put("ptMsg", "商品名稱重複");
		}else {
			map.put("ptMsg", "商品名稱可使用");
		}
		
		
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		out.write(gson.toJson(map));
		session.getTransaction().commit();
		out.close();
		
	}

}
