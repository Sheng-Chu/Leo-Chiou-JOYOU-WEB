package joyou.friends.Recommend;

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

import joyou.Members.model.MembersBean;
import joyou.friends.model.FriendsBean;
import joyou.util.HibernateUtil;

@WebServlet("/FriendsRecommendServlet.do")
public class FriendsRecommendServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private List<FriendsBean> SearchResult;
	private List<MembersBean> SearchResultList;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}
	
private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		
	System.out.println("77777777");
	
	//抓到會員ID
	Integer memberId = (Integer) request.getSession().getAttribute("memberID");
	Integer memberPreferGameType = (Integer) request.getSession().getAttribute("memberPreferGameType");
	System.out.println("77778888999 memberID:   "+ memberId );
	System.out.println("77778888999 memberPreferGameType:   "+ memberPreferGameType );
		
		TTTTTTTTTTestFFFFFFFFFriendDao pDao = new TTTTTTTTTTestFFFFFFFFFriendDao(session);
		Integer TestGameTypeTxt =  memberPreferGameType;
		Integer memberID =  memberId;
		
		
		SearchResult = pDao.getAlreadyFriends(memberID);
		SearchResultList = pDao.getSameGameTypeMembers(TestGameTypeTxt,memberID, SearchResult);
		
		
		PrintWriter out = response.getWriter(); 
		Gson gs = new Gson();
		String jsonPt = gs.toJson(SearchResultList);
		
		
		out.write(jsonPt);
		
		session.getTransaction().commit();
		out.close();
	}


}
