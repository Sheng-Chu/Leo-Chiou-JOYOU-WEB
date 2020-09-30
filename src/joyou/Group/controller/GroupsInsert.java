package joyou.Group.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.gson.Gson;


import joyou.Group.dao.GroupsDao;
import joyou.Group.dao.impl.GroupsDaoImpl;
import joyou.Group.model.Groups;
import joyou.util.HibernateUtil;

/**
 * Servlet implementation class GroupsInsert
 */
@WebServlet("/GroupsInsert")
public class GroupsInsert extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		 String groupname = request.getParameter("groupname");
		 System.out.println(request.getParameter("groupname"));
		 Integer gametypeId = Integer.parseInt(request.getParameter("gametypeId"));
		 Integer groupCount= Integer.parseInt(request.getParameter("groupCount"));
		 String groupTime = request.getParameter("groupTime");
		 Integer storeId = Integer.parseInt(request.getParameter("storeId"));
		 Integer groupprice = Integer.parseInt(request.getParameter("groupprice"));
		 Integer memberID = Integer.parseInt(request.getParameter("memberID"));
		 Integer groupmember = Integer.parseInt(request.getParameter("groupmember"));
		 String startdate = request.getParameter("startdate");
		 String enddate = request.getParameter("enddate");
		 String deadline =  request.getParameter("deadline");
		 String storeAddress = request.getParameter("storeAddress");
		 Integer limit = Integer.parseInt(request.getParameter("limit"));
		 Integer groupnumber = Integer.parseInt(request.getParameter("groupnumber"));
		 String groupdescription = request.getParameter("groupdescription");
		 
		 Groups groups = new Groups( null,  groupname, gametypeId, groupCount, groupTime, storeId, groupprice, memberID, groupmember, startdate, enddate, deadline, storeAddress, limit, groupnumber, groupdescription);
		 
		GroupsDao dao = new GroupsDaoImpl();
		

		dao.saveGroup(groups);
		session.getTransaction().commit();
		Map<String, String> map = new HashMap<>();
		map.put("success", "新增成功");
		out.println(gson.toJson(map));
		out.close();
		return;
	      
 
	}
}

