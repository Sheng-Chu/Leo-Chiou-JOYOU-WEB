package joyou.Group.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;

import joyou.Group.dao.GroupsDao;
import joyou.Group.dao.impl.GroupsDaoImpl;
import joyou.Group.model.Groups;
import joyou.util.HibernateUtil;

@WebServlet("/groupslist.json")
public class GroupsShowAlljson extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		try(
				PrintWriter out = response.getWriter();
			) {
				GroupsDao dao = new GroupsDaoImpl();
				List<Groups> list = dao.findAllGroups(); 
				String categoriesJson = new Gson().toJson(list); 
	            out.write(categoriesJson);
			} finally{
		        if(session != null){
		        	session.getTransaction().commit();
		        }
	}
}
}