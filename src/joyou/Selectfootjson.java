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
@WebServlet("/footlist.json")
public class Selectfootjson extends HttpServlet{
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
				
				 

				 String usefoot=""; 
				 int[] foot= new int [9];
				 int[] tree= new int [10];
				 int count = 0;
				 
				 
				 
				 
				 for(int i=0;i<mbean.size();i++) {
					 	String s1 =mbean.get(i).getUserfoot();
					 	usefoot+=s1;
					}
					
				//分割
				 StringTokenizer st = new StringTokenizer(usefoot, ".");
				 while (st.hasMoreElements()) {

						count++;
						String s =st.nextToken();
						String s2=s;
						String s3=s;
						String a ="12";
						String b ="23";
						String c ="24";
						String d ="25";
						String e ="26";
						String f ="27";
						String g ="46";
						String h ="56";
						String i ="68";
						String j ="89";
						
						
						//桑基圖
						for(int k=0;k<s2.length()-1;k++) {
							String lis =s2.substring(k, k+2);
							if(lis.equals(a)) {
								tree[0]++;
							}
							if(lis.equals(b)) {
								tree[1]++;
							}
							if(lis.equals(c)) {
								tree[2]++;
							}
							if(lis.equals(d)) {
								tree[3]++;
							}
							if(lis.equals(e)) {
								tree[4]++;
							}
							if(lis.equals(f)) {
								tree[5]++;
							}
							if(lis.equals(g)) {
								tree[6]++;
							}
							if(lis.equals(h)) {
								tree[7]++;
							}
							if(lis.equals(i)) {
								tree[8]++;
							}
							if(lis.equals(j)) {
								tree[9]++;
							}
							
						}
						
						
						//轉換漏斗  要的是百分比 0 1 5 7 8
						for(int i1=0;i1< s3.length();i1++) {
							
							char ch =s3.charAt(i1);
							int a1 = ch - 48;
							switch(a1) {
							case 1:
								foot[0]++;
								break;
							case 2:
								foot[1]++;
								break;	
							case 3:
								foot[2]++;
								break;
							case 4:
								foot[3]++;
								break;
							case 5:
								foot[4]++;
								break;
							case 6:
								foot[5]++;
								break;
							case 7:
								foot[6]++;
								break;
							case 8:
								foot[7]++;
								break;
							case 9:
								foot[8]++;
								break;
							}
						}
					}
				 
				 	for(int i=0;i<foot.length;i++) {
				 		foot[i]=(foot[i]*100)/count;
				 	}

				
				 	int[] result = new int[tree.length + foot.length];
				    
				    for (int i = 0; i < tree.length; i++) {//把a阵列的元素依次插入
				      result[i] = tree[i];
				    }
				    
				    for (int i = 0; i < foot.length; i++) {//把b阵列的元素依次插入
				      result[tree.length + i] = foot[i]; //注意左边开始的位置在插入a阵列之后。
				    }
				    
				    request.getSession().setAttribute("footlist",result);
				  //桑基圖+轉換漏斗
					String categoriesJson = new Gson().toJson(result); 
		            out.write(categoriesJson);
			} finally{
		        if(session != null){
		            session.close();
		        }
	}
}
	
	
	
}
