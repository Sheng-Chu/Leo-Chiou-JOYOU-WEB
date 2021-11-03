package joyou.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import joyou.forum.dao.ForumBeanDAO;
import joyou.forum.dao.ForumBeanDAOImpl;
import joyou.forum.model.ForumBean;
import joyou.forum.model.ReplyBean;
import joyou.util.HibernateUtil;

@WebServlet("/UpdateForumServlet")
public class ForumBeanUpdate extends HttpServlet {

	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		
		
		Integer contentid = (Integer) request.getSession().getAttribute("fId");
		String content = request.getParameter("Content");
		ForumBeanDAO fDAO = new ForumBeanDAOImpl(session);
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		

		fDAO.update(contentid, content,date);
	    request.getRequestDispatcher("ForumListIndex.jsp").forward(request, response);
	    session.getTransaction().commit();
}
}