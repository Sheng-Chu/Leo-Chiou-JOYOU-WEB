package joyou.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;

import joyou.forum.dao.ForumBeanDAOImpl;
import joyou.forum.dao.ReplyBeanDAO;
import joyou.forum.dao.ReplyBeanDAOImpl;
import joyou.forum.model.ForumBean;
import joyou.forum.model.ReplyBean;
import joyou.util.HibernateUtil;

@WebServlet("/InsertReplyServlet")
public class ReplyBeanInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Map<String, String> errorMsg = new HashMap<>();

		request.setAttribute("errorMsg", errorMsg);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		System.out.println(out);
		String replyContent = request.getParameter("replyContent");
		System.out.println(request.getParameter("replyContent"));
//		Integer replyId = Integer.parseInt(request.getParameter("replyId"));
//		Integer contentId = Integer.parseInt(request.getParameter("Content"));
//		String replyDate = request.getParameter("replyDate");
//		Integer memberId = Integer.parseInt(request.getParameter("memberId"));
//		String memberNickName = request.getParameter("memberNickName");
		
		

		ReplyBean rBean = new ReplyBean(null, replyContent, null, null, null);

		ReplyBeanDAO rDAO = new ReplyBeanDAOImpl();

		rDAO.reply(rBean);
		session.getTransaction().commit();
		Map<String, String> map = new HashMap<>();
		map.put("success", "回復文章成功");
		out.println(gson.toJson(map));
		session.getTransaction().commit();
		out.close();
		
	}

}


