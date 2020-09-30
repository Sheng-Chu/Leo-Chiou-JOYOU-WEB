package joyou.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/DeleteForumServlet")
public class ForumBeanDelete extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ForumBeanDAO fDAO = new ForumBeanDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer contentid;
		contentid = Integer.parseInt(request.getParameter("contentId").trim());
		response.setContentType("application/json; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		PrintWriter out = response.getWriter();
		ForumBean fBean = fDAO.select(contentid);
		if (fBean != null) {
			fDAO.delete(contentid);
			out.write("該篇文章已刪除");
		} else {
			out.write("該篇文章並不存在");
		}
		session.getTransaction().commit();
		out.close();
		return;

	}

}