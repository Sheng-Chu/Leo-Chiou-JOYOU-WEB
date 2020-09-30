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
import joyou.forum.model.ForumBean;
import joyou.util.HibernateUtil;

@WebServlet("/InsertForumServlet")
public class ForumBeanInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Map<String, String> errorMsg = new HashMap<>();
		System.out.println("bbbbbb");
		request.setAttribute("errorMsg", errorMsg);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		System.out.println(out);
		String contentTitle = request.getParameter("contentTitle");
		System.out.println(request.getParameter("contentTitle"));
		Integer contentId = Integer.parseInt(request.getParameter("contentId"));
//		Integer gameType =  Integer.parseInt(request.getParameter("gameType"));
		String Content = request.getParameter("Content");
//		String contentType =request.getParameter("contentType");
		String contentDate = request.getParameter("contentDate");
		String contentLatestUpdate = request.getParameter("contentLatestUpdate");
		
		
//		Integer memberId = Integer.parseInt(request.getParameter("memberId"));
		String memberNickName = request.getParameter("memberNickName");
		
		

		ForumBean fBean = new ForumBean(contentId, null, contentTitle, Content, null, contentDate,
				contentLatestUpdate, null, memberNickName);

		ForumBeanDAOImpl fDAO = new ForumBeanDAOImpl();

		fDAO.insert(fBean);
		session.getTransaction().commit();
		Map<String, String> map = new HashMap<>();
		map.put("success", "新增文章成功");
		out.println(gson.toJson(map));
		out.close();
		session.getTransaction().commit();
		return;
	}

}