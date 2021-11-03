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

import joyou.forum.dao.ForumBeanDAO;
import joyou.forum.dao.ForumBeanDAOImpl;
import joyou.forum.dao.ReplyBeanDAO;
import joyou.forum.dao.ReplyBeanDAOImpl;
import joyou.forum.model.ForumBean;
import joyou.forum.model.ReplyBean;
import joyou.util.HibernateUtil;

@WebServlet("/DeleteReplyServlet")
public class ReplyBeanDelete extends HttpServlet {

	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer replyid;
		replyid = Integer.parseInt(request.getParameter("replyId").trim());
		response.setContentType("application/json; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		ReplyBeanDAO rDAO = new ReplyBeanDAOImpl(session);
		session.beginTransaction();
		PrintWriter out = response.getWriter();
		ReplyBean rBean = rDAO.select(replyid);
		if (rBean != null) {
			rDAO.delete(replyid);
			out.write("該篇文章已刪除");
		} else {
			out.write("該篇文章並不存在");
		}
		session.getTransaction().commit();
		out.close();

	}

}