package joyou.friends.Recommend;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import joyou.GameTypes.dao.GameTypesDao;
import joyou.util.HibernateUtil;



@WebServlet("/ShowSingalFriendServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ShowSingalFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Session session;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		session = factory.openSession();
		session.beginTransaction();
		
		String memberID = request.getParameter("id");
		String memberMail = request.getParameter("mail");
		String memberPhone = request.getParameter("phone");
		String memberNickName = request.getParameter("nickname");
		String memberGender = request.getParameter("gender");
		String memberPreferGameType = request.getParameter("preferGameType");
		String memberImageFileName = request.getParameter("imageFileName");
		
		int id = Integer.parseInt(memberPreferGameType);
		GameTypesDao gDao = new GameTypesDao(session);
		String typeName = gDao.getGameTypeId(id);
		System.out.println("Gametype:"+typeName);
		
		request.getSession().setAttribute("searchmemberID", memberID);
		request.getSession().setAttribute("searchmemberMail", memberMail);
		request.getSession().setAttribute("searchmemberPhone", memberPhone);
		request.getSession().setAttribute("searchmemberNickName", memberNickName);
		request.getSession().setAttribute("searchmemberPreferGameType",typeName);
		request.getSession().setAttribute("searchmemberGender", memberGender);
		request.getSession().setAttribute("searchmemberImageFileName", memberImageFileName);
		request.getSession().setAttribute("searchtypeName", typeName);
		
		session.getTransaction().commit();
		request.getRequestDispatcher("FriendDetail.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
