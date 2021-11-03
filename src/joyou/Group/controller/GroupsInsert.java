package joyou.Group.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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

@MultipartConfig(location = "C:/share/datasource/SpringSource/springworkspace/JoYouProject/WebContent/img/groups", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024
* 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/GroupsInsert" }, loadOnStartup = 1)
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
		 UUID uuid = UUID.randomUUID();
		 
		 String groupname = request.getParameter("groupname");
		 System.out.println(request.getParameter("groupname"));
		 Integer gametypeId = Integer.parseInt(request.getParameter("gametypeId"));
		 Integer groupCount= Integer.parseInt(request.getParameter("groupCount"));
		 String groupTime = request.getParameter("groupTime");
		
		 Integer groupprice = Integer.parseInt(request.getParameter("groupprice"));
		 Integer memberID = (Integer) request.getSession().getAttribute("memberID");
		 String groupmember = (String) request.getSession().getAttribute("memberAccount");
		 String startdate = request.getParameter("startdate");
		 String enddate = request.getParameter("enddate");
		 String deadline =  request.getParameter("deadline");
		 String storeAddress = request.getParameter("storeAddress");
		 Integer limit = Integer.parseInt(request.getParameter("limit"));
		 String groupdescription = request.getParameter("groupdescription");
		 String fileName =  uuid.toString() + ".jpg";
		 Part part = request.getPart("imageFile");
			System.out.println("fileName:" + fileName);
			part.write(fileName);
		 Groups groups = new Groups( null,  groupname, gametypeId, groupCount, groupTime, 3050, groupprice, memberID, groupmember, startdate, enddate, deadline, storeAddress, limit, 1, groupdescription,fileName);
		 
		GroupsDao dao = new GroupsDaoImpl();
		

		dao.saveGroup(groups);
		session.getTransaction().commit();

		response.sendRedirect("./groups.jsp");
	      
 
	}
}

