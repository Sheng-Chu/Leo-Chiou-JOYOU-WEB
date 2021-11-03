package joyou.Discounts.controller;

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
import joyou.Discounts.model.DiscountsDao;
import joyou.util.HibernateUtil;

@WebServlet("/DiscountsCheckServlet.do")
public class DiscountsCheckServlet extends HttpServlet {
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
		
		String Code = request.getParameter("discountName");
		DiscountsDao dDao = new DiscountsDao(session);
		Map<String, String> map = new HashMap<>();
		if(Code==null||Code.trim().isEmpty()||Code.equals("")) {
			map.put("disMsg", "欄位不可空白");
			
		}else if(dDao.checkCode(Code)) {
			map.put("disMsg", "折扣碼重複");
			
		}else {
			map.put("disMsg", "代碼可使用");
		}
		
		
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		out.write(gson.toJson(map));
		session.getTransaction().commit();
		out.close();
		
	}

}
