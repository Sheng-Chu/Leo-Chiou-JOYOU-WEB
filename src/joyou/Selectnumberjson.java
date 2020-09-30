package joyou;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanDao;
import joyou.Members.model.MembersBeanService;
import joyou.util.HibernateUtil;
@WebServlet("/memberlist.json")
public class Selectnumberjson extends HttpServlet{
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
			
			
			
			MembersBeanService dao = new  MembersBeanService(session);
				 List<MembersBean> mbean = dao.getAllMembers(); 
				
				 

					 
					 int  gender[] = new int[3];
					 int gametype[]= new int [9];
					 
				 for(int i=0;i<mbean.size();i++) {
					 	
					 	String g =mbean.get(i).getGender();

					 	
						gender[2]++;
						
						if(g.equals("M")) {
							 gender[0]++;
						}else if(g.equals("F")) {
							gender[1]++;
						}
					}
				 
				 for(int i=0;i<mbean.size();i++) {
					 int type =mbean.get(i).getPreferGameType();
					 	if(type==5001) {
					 		gametype[0]++;
					 	}
					 	if(type==5002) {
					 		gametype[1]++;
					 	}
					 	if(type==5003) {
					 		gametype[2]++;
					 	}
					 	if(type==5004) {
					 		gametype[3]++;
					 	}
					 	if(type==5005) {
					 		gametype[4]++;
					 	}
					 	if(type==5006) {
					 		gametype[5]++;
					 	}
					 	if(type==5007) {
					 		gametype[6]++;
					 	}
					 	if(type==5008) {
					 		gametype[7]++;
					 	}
					 	
				 }
				 

				 	int max=0;
				 	for(int j=0;j<8;j++) {
				 		if(gametype[j]>max) {
				 			max=gametype[j];
				 		}
				 	}
				 	gametype[8]=max;
				 	
				 
				
				 request.getSession().setAttribute("countnumber", gender[2]);
				 request.getSession().setAttribute("gametype", gametype);
					String categoriesJson = new Gson().toJson(gender); 
		            out.write(categoriesJson);
			} finally{
		        if(session != null){
		            session.close();
		        }
	}
}
	
	
	
}
