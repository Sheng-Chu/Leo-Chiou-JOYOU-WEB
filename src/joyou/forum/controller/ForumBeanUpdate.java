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

import joyou.forum.dao.ForumBeanDAO;
import joyou.forum.dao.ForumBeanDAOImpl;
import joyou.forum.model.ForumBean;
import joyou.util.HibernateUtil;

@WebServlet("/UpdateForumServlet")
public class ForumBeanUpdate extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ForumBeanDAO fDAO = new ForumBeanDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer contentid;
		String contenttitle;
		String contentlatestupdate;
		contentid = Integer.parseInt(request.getParameter("contentId").trim());
		contenttitle = request.getParameter("contentTitle").trim();
		contentlatestupdate = request.getParameter("contentLatestUpdate").trim();
		response.setContentType("application/json; charset=utf-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		PrintWriter out = response.getWriter();
		ForumBean fBean = fDAO.update(contentid, contenttitle, contentlatestupdate);
		String categoriesJson = new Gson().toJson(fBean); 
	    out.write(categoriesJson);
	    session.getTransaction().commit();
	    out.close();
}
}