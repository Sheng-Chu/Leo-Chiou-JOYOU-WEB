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

@WebServlet("/ShowAllForumServlet")
public class ForumBeanShowAll extends HttpServlet {
	
private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
    response.setContentType("application/json; charset=utf-8");
	SessionFactory factory = HibernateUtil.getSessionFactory();
	Session session = factory.getCurrentSession();
	session.beginTransaction();
	try(PrintWriter out = response.getWriter();) {
		ForumBeanDAO fDAO = new ForumBeanDAOImpl();
	List<ForumBean> fBean = fDAO.selectAll();
	String categoriesJson = new Gson().toJson(fBean); 
    out.write(categoriesJson);
    session.getTransaction().commit();
    out.close();
 
	}


		
	}

}
