package joyou.maintain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import joyou.Members.model.MembersBeanDao;
import joyou.util.HibernateUtil;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/MemberDeleteServlet.do")
public class MemberDeleteServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

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

		int delId = Integer.parseInt(request.getParameter("memberID"));
		MembersBeanDao mDao = new MembersBeanDao(session);
		boolean result = mDao.delete(delId);

		if (result)
		{
			request.setAttribute("DeleteMsg", "Delete Successfully!");
		} else
		{
			request.setAttribute("DeleteMsg", "Delete UnSuccessfully!");
		}

		session.getTransaction().commit();
	}

}
