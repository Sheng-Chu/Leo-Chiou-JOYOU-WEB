package joyou.maintain;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.google.gson.GsonBuilder;

import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanDao;
import joyou.util.HibernateUtil;

@WebServlet("/GetMemberPageServlet.do")
@javax.servlet.annotation.MultipartConfig
public class GetMemberPageServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private List<MembersBean> list;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		MembersBeanDao mDao = new MembersBeanDao(session);
		Integer pageNo = 1;
		Integer totalPage = 1;
		String pageNoStr = request.getParameter("pageNo");
		String totalPageStr = request.getParameter("totalPage");
		String type = request.getParameter("type");

		System.out.println("pageNoStr" + pageNoStr);
		if (pageNoStr != null)
		{
			try
			{
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}

		if (totalPageStr != null)
		{
			try
			{
				totalPage = Integer.parseInt(totalPageStr.trim());
			} catch (Exception e)
			{
				e.printStackTrace();
				totalPage = mDao.getTotalPages();
			}
		} else
		{
			totalPage = mDao.getTotalPages();
		}

		if (type.equals("all"))
		{
			list = mDao.selectByPage(pageNo);

		}
		PrintWriter out = response.getWriter();

		Gson gs = new Gson();
		String jsonMembers = gs.toJson(list);
		out.write(jsonMembers);
		out.write("&&&");
		Map<String, Integer> map = new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("currPage", pageNo);
		out.write(gs.toJson(map));
		session.getTransaction().commit();
		out.close();

	}
}
