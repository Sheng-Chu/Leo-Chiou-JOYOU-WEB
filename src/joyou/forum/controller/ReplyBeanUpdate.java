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
import com.google.gson.GsonBuilder;

import joyou.forum.dao.ReplyBeanDAO;
import joyou.forum.dao.ReplyBeanDAOImpl;
import joyou.forum.model.ReplyBean;
import joyou.util.HibernateUtil;

@WebServlet("/UpdateReplyServlet")
public class ReplyBeanUpdate extends HttpServlet {

	private static final long serialVersionUID = 1L;
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		ReplyBeanDAO rDAO = new ReplyBeanDAOImpl(session);
		session.beginTransaction();
		Integer replyid;
		String replycontent;
		replyid = (Integer) request.getSession().getAttribute("replyId");
		System.out.println(replyid);
		replycontent = request.getParameter("replyContent");
		System.out.println("777777"+replycontent);
		String hql = "from ReplyBean where replyId=:rid";
		ReplyBean replyBean= (ReplyBean)session.createQuery(hql)
    	        .setParameter("rid", replyid)
    	        .uniqueResult();
		System.out.println(replycontent);
         System.out.println(replyBean.getReplyContent());
		PrintWriter out = response.getWriter();
		ReplyBean rBean = rDAO.update(replyid,replycontent);
		Gson gs = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String categoriesJson = gs.toJson(rBean);
		out.write(categoriesJson);
		request.getRequestDispatcher("ForumListIndex.jsp").forward(request, response);
		session.getTransaction().commit();
		out.close();
	}
}
