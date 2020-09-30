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
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;

import joyou.Group.dao.GroupsDao;
import joyou.Group.dao.impl.GroupsDaoImpl;
import joyou.Group.model.Groups;
import joyou.util.HibernateUtil;

@WebServlet("/GroupsSingle")
public class GroupsShowjson extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	GroupsDao dao = new GroupsDaoImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer groupid;
		groupid = Integer.parseInt(request.getParameter("groupId").trim());
	    response.setContentType("application/json; charset=utf-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		PrintWriter out = response.getWriter();
		Groups groups = dao.findByGroupId(groupid);
		String categoriesJson = new Gson().toJson(groups); 
        out.write(categoriesJson);
        session.getTransaction().commit();
	}
}
