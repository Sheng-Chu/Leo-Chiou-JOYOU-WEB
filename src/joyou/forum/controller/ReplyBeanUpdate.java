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

import joyou.forum.dao.ReplyBeanDAO;
import joyou.forum.dao.ReplyBeanDAOImpl;
import joyou.forum.model.ReplyBean;
import joyou.util.HibernateUtil;

@WebServlet("/UpdateReplyServlet")
public class ReplyBeanUpdate extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ReplyBeanDAO rDAO = new ReplyBeanDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer replyid;
		String replycontent;
		String replydate;
		replyid = Integer.parseInt(request.getParameter("replyId").trim());
		replycontent = request.getParameter("replyContent").trim();
		replydate = request.getParameter("replyDate").trim();
		response.setContentType("application/json; charset=utf-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		PrintWriter out = response.getWriter();
		ReplyBean rBean = rDAO.update(replyid, replycontent, replydate);
		String categoriesJson = new Gson().toJson(rBean);
		out.write(categoriesJson);
		session.getTransaction().commit();
		out.close();

	}
}
