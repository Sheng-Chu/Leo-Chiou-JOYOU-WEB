package joyou.Orders.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import joyou.GameTypes.dao.GameTypesDao;
import joyou.util.HibernateUtil;



@WebServlet("/ShowSingalProductServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ShowSingalProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Session session;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		session = factory.openSession();
		session.beginTransaction();
		
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productIntro = request.getParameter("productIntro");
		String gameType = request.getParameter("gameType");
		String productAge = request.getParameter("productAge");
		String suggestNum = request.getParameter("suggestNum");
		String productLang = request.getParameter("productLang");
		String productStock = request.getParameter("productStock");
		String imgName = request.getParameter("imgName");
		
		int id = Integer.parseInt(gameType);
		System.out.println(id);
		GameTypesDao gDao = new GameTypesDao(session);
		String typeName = gDao.getGameTypeId(id);
		System.out.println("44"+typeName);
		
		request.setAttribute("productId", productId);
		request.setAttribute("productName", productName);
		request.setAttribute("productPrice", productPrice);
		request.setAttribute("productIntro", productIntro);
		request.setAttribute("typeName",typeName);
		request.setAttribute("productAge", productAge);
		request.setAttribute("suggestNum", suggestNum);
		request.setAttribute("productLang", productLang);
		request.setAttribute("productStock", productStock);
		request.setAttribute("imgName", imgName);
		
		session.getTransaction().commit();
		request.getRequestDispatcher("ProductsDetail.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
