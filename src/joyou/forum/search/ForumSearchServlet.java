package joyou.forum.search;

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

import joyou.forum.model.ForumBean;
import joyou.util.HibernateUtil;

@WebServlet("/ForumSearchServlet.do")
public class ForumSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<ForumBean> SearchContentResultList;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		ForumsDao fDao = new ForumsDao(session);
		String SearchInputTxt = request.getParameter("SearchInputTxt");
		SearchContentResultList = fDao.getContentListToJSON(SearchInputTxt);
				
		PrintWriter out = response.getWriter(); 
		Gson gs = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String jsonForum = gs.toJson(SearchContentResultList);
		
		out.write(jsonForum);
		
		session.getTransaction().commit();
		session.close();
		out.close();
		
	}

}
