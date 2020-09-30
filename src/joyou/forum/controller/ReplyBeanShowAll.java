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

import joyou.forum.dao.ReplyBeanDAO;
import joyou.forum.dao.ReplyBeanDAOImpl;
import joyou.forum.model.ReplyBean;
import joyou.util.HibernateUtil;

@WebServlet("/ShowAllReplyServlet")
public class ReplyBeanShowAll extends HttpServlet {

	private static final long serialVersionUID = 1L;

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		try (PrintWriter out = response.getWriter();) {
			ReplyBeanDAO rDAO = new ReplyBeanDAOImpl();
			List<ReplyBean> rBean = rDAO.selectAll();
			String categoriesJson = new Gson().toJson(rBean);
			out.write(categoriesJson);
			session.getTransaction().commit();
			out.close();
			  
		}
		 
	}
}