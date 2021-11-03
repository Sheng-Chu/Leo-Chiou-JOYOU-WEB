package joyou.Group.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import joyou.Group.dao.GroupsDao;
import joyou.Group.dao.impl.GroupsDaoImpl;
import joyou.Group.model.Groups;
import joyou.util.HibernateUtil;

/**
 * Servlet implementation class GroupAdd
 */
@WebServlet("/GroupAdd")
public class GroupAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer groupid;
//		groupid = Integer.parseInt(request.getParameter("groupId").trim());
//		System.out.println(groupid);
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx=session.beginTransaction();  
		Integer sgroupid = (Integer) request.getSession().getAttribute("groupid");
         String hql = "from Groups where groupId=:gid";    
         Groups groups= (Groups)session.createQuery(hql)
        	        .setParameter("gid", sgroupid)
        	        .uniqueResult();
        System.out.println(groups.getGroupname());
        Integer sgn = groups.getGroupnumber();
		String sgm = groups.getGroupmember();
		Integer slimit = groups.getLimit();
		 if(sgn >= slimit) {
			 System.out.println("活動人數已滿");
		 }else {
			 Query q=session.createQuery("update Groups g set g.groupmember= :gmember , g.groupnumber= :gnumber where g.groupId= :gid");
				Integer gn = groups.getGroupnumber()+1;
				String ga  ;
				if(sgn<=1) {
					 ga= sgm+","+ (String) request.getSession().getAttribute("memberAccount");
				}else {
					 ga= sgm+","+(String) request.getSession().getAttribute("memberAccount");
				}
				
				q.setParameter("gnumber",gn);  
				q.setParameter("gmember",ga);  
				q.setParameter("gid",sgroupid);  
				q.executeUpdate();
		 }
		 
		 
		 
		
		
		session.getTransaction().commit();
		response.sendRedirect("./groups.jsp");
	}

}
