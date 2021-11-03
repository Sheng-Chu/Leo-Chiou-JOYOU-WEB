package joyou.friends.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;



import joyou.friends.dao.FriendsDao;

import joyou.util.HibernateUtil;

@WebServlet("/FriendsDelete.do")
@javax.servlet.annotation.MultipartConfig
public class FriendsDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		

		
		FriendsDao fDao = new FriendsDao(session);
		String friends_numbs = request.getParameter("memID");
		
		Boolean isDelete  = fDao.delete(Integer.parseInt(friends_numbs));
		if(!isDelete) {
			request.setAttribute("InsertMsg", "好友刪除成功失敗!");
			request.getRequestDispatcher("FriendDetail02.jsp").forward(request, response);

		}else {
			request.getRequestDispatcher("FriendPage.jsp").forward(request, response);
			session.getTransaction().commit();
			
		}

		
	}

}
