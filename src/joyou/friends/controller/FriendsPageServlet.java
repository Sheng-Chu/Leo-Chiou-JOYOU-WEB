package joyou.friends.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import joyou.friends.dao.FriendsDao;
import joyou.friends.dao.FriendsDetailDao;
import joyou.friends.model.FriendsBean;
import joyou.friends.model.FriendsDetailBean;
import joyou.util.HibernateUtil;

@WebServlet("/FriendsaPage.do")
@javax.servlet.annotation.MultipartConfig
public class FriendsPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		try {
			FriendsDao fDao = new FriendsDao(session);
			Integer memberId = (int) request.getSession().getAttribute("memberID");

			List<FriendsBean> list = fDao.getFriends_numbsbymemberId(memberId);
			List<Map<String,Object>> result = new ArrayList<>();
			FriendsDetailDao fdDao = new FriendsDetailDao(session);
			for(FriendsBean bean:list) {
				FriendsDetailBean fdb= fdDao.selectByFrinendId(bean.getFriendId());
				Map<String,Object> test = new HashMap<String,Object>();
				test.put("friends_numbs", bean.getFriends_numbs());
				test.put("memberId", bean.getMemberId());
				test.put("friendId", bean.getFriendId());
				
				
				if(null != fdb) {
					test.put("account", fdb.getAccount());
					test.put("mail", fdb.getMail());
					test.put("nickname", fdb.getNickname());
					test.put("phone", fdb.getPhone());
					test.put("gender", fdb.getGender());
					test.put("picturepath", fdb.getPicturepath());
					test.put("gametypeid", fdb.getGametypeid());
					
				}
				
				
				result.add(test);
				
				
				
			
			}
			System.out.println("7777"+list);
			
			
			PrintWriter out = response.getWriter();
			
			
			String friendJson = new Gson().toJson(result); 
            out.write(friendJson);
            out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.getTransaction().commit();
		
	}

}
