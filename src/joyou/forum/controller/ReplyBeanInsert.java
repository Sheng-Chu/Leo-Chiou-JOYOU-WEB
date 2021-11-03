package joyou.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;

import joyou.Members.model.MembersBeanDao;
import joyou.forum.dao.ForumBeanDAOImpl;
import joyou.forum.dao.ReplyBeanDAO;
import joyou.forum.dao.ReplyBeanDAOImpl;
import joyou.forum.model.ForumBean;
import joyou.forum.model.ReplyBean;
import joyou.util.HibernateUtil;

@WebServlet("/InsertReplyServlet")
public class ReplyBeanInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
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

		String replyContent = request.getParameter("replyContent");
		int contentId = (int)request.getSession().getAttribute("fId");
		Integer memberId = (int)request.getSession().getAttribute("memberID");
		MembersBeanDao mDao = new MembersBeanDao(session);
		String memberNickName = mDao.getMemberById(memberId).getNickName();
		String imageFileName = mDao.getMemberById(memberId).getImageFileName();
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		
		
		
		

		ReplyBean rBean = new ReplyBean(null,replyContent, date, memberId, memberNickName,imageFileName);
		
		ForumBeanDAOImpl fDao = new ForumBeanDAOImpl();
		ReplyBeanDAOImpl rDao = new ReplyBeanDAOImpl(session);
		ForumBean fBean = fDao.select(contentId);
		rBean.setforumBean(fBean);
		rDao.reply(rBean);
		
		
		
		
		Map<String, String> map = new HashMap<>();
		map.put("success", "回復文章成功");
		out.println(gson.toJson(map));
		session.getTransaction().commit();
		out.close();
		
	}

}


