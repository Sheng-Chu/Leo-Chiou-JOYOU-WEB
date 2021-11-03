package joyou.forum.controller;

import java.io.IOException; 
import java.io.PrintWriter;
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
import joyou.util.HibernateUtil;

@WebServlet("/SelectSingleForumServlet")
public class ForumBeanSelectSingle extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ForumBeanDAO fDAO = new ForumBeanDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		int contentid = Integer.parseInt(request.getParameter("contentId"));
		request.getSession().setAttribute("fId", contentid);
		
		PrintWriter out = response.getWriter();
		ForumBean fBean = fDAO.select(contentid);
		Gson gs = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String categoriesJson = gs.toJson(fBean);
		out.write(categoriesJson);
		session.getTransaction().commit();
		
		out.close();
	}
}