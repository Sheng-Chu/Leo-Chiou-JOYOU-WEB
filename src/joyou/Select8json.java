package joyou;

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
import com.google.gson.GsonBuilder;

import joyou.Orders.dao.OrderItemDao;
import joyou.Orders.model.OrderItemBean;
import joyou.util.HibernateUtil;
@WebServlet("/orderlist.json")
public class Select8json extends HttpServlet{
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
				 OrderItemDao dao = new OrderItemDao(session);
				 List<OrderItemBean> obean = dao.selectAll(); 
				
				  	 int  partyGames= 0;
					 int  strategyGames= 0;
					 int  themeticGames= 0;
					 int  warGames= 0;
					 int  abstractGames= 0;
					 int  customizableGames= 0;
					 int  childrenGames= 0;
					 int  familyGames= 0;
					 int  eight[] = new int[9];
				 
				 for(int i=0;i<obean.size();i++) {
						
						int id =obean.get(i).getProductId();
						int price =obean.get(i).getProductPrice();
						
						if(id==1||id==14||id==17||id==19) {
							partyGames=partyGames+price;
						}
						if(id==8||id==18) {
							strategyGames=strategyGames+price;
						}
						if(id==3||id==10) {
							themeticGames=themeticGames+price;
						}
						if(id==4||id==21) {
							warGames=warGames+price;
						}
						if(id==11||id==16) {
							abstractGames=abstractGames+price;
						}
						if(id==7||id==9) {
							customizableGames=customizableGames+price;
						}
						if(id==5||id==6||id==15||id==20) {
							childrenGames=childrenGames+price;
						}
						if(id==2||id==12||id==13) {
							familyGames=familyGames+price;
						}
					}
					
				 	eight[0]=partyGames;
					eight[1]=strategyGames;
					eight[2]=themeticGames;
					eight[3]=warGames;
					eight[4]=abstractGames;
					eight[5]=customizableGames;
					eight[6]=childrenGames;
					eight[7]=familyGames;
					eight[8]=0;
					for(int i =0 ;i<8;i++) {
						eight[8]=eight[8]+eight[i];
					}
					request.getSession().setAttribute("countsell", eight[8]);
				 
				Gson gs = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
				String categoriesJson = gs.toJson(eight); 
	            out.write(categoriesJson);
			} finally{
		        if(session != null){
		            session.close();
		        }
	}
}
}
