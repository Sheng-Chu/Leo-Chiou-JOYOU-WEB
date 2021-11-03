package joyou.friends.controller;

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

@WebServlet("/FriendsDetail.do")
@javax.servlet.annotation.MultipartConfig
public class FriendsDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private Session session;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		String friends_numbs = request.getParameter("friends_numbs");
		String friendId = request.getParameter("friendId");
		String mail = request.getParameter("mail");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String picturepath = request.getParameter("picturepath");
		String gametypeid = request.getParameter("gametypeid");
			
	
		
		int id = Integer.parseInt(gametypeid);
		GameTypesDao gDao = new GameTypesDao(session);
		String typeName = gDao.getGameTypeId(id);
		System.out.println("Gametype:"+typeName);
		
		request.getSession().setAttribute("friends_numbs", friends_numbs);
		request.getSession().setAttribute("friendId", friendId);
		request.getSession().setAttribute("mail", mail);
		request.getSession().setAttribute("nickname", nickname);
		request.getSession().setAttribute("phone", phone);
		request.getSession().setAttribute("gender", gender);
		request.getSession().setAttribute("picturepath", picturepath);
		request.getSession().setAttribute("typeName", typeName);
			
		session.getTransaction().commit();
		request.getRequestDispatcher("FriendDetail02.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}
