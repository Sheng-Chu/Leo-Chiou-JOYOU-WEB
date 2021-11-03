package joyou.Members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanService;
import joyou.util.HibernateUtil;

@WebServlet("/up_MemberEditPasswordServlet")
public class MemberEditPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String userAccount = request.getParameter("userAccount");
		String userPassword = request.getParameter("userPassword");

		System.out.println("account= " + userAccount);
		System.out.println("password= " + userPassword);

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();

		boolean UpdateSuccess = new MembersBeanService(session)
				.update(new MembersBean(userAccount, userPassword, null, null, null, null, null, null, null, null));

		tx.commit();

		if (UpdateSuccess) {

			request.getSession().setAttribute("UpdateSuccess", "更新會員資料成功");
			request.getSession().setAttribute("memberAccount", userAccount);
//			request.getRequestDispatcher("up_MemberProfilePage.jsp").forward(request, response);
			request.getRequestDispatcher("member-profile.jsp").forward(request, response);

		} else {

			request.getSession().setAttribute("UpdateSuccess", "更新會員資料失敗");
//			request.getRequestDispatcher("up_MemberProfilePage.jsp").forward(request, response);
			request.getRequestDispatcher("member-profile.jsp").forward(request, response);

		}

	}

}