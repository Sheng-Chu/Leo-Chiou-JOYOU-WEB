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

@WebServlet("/up_MemberLoginServlet")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String loginAccount = request.getParameter("userAccount");
		String loginPassword = request.getParameter("userPassword");

		System.out.println("userAccount=" + loginAccount);
		System.out.println("userPassword=" + loginPassword);

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();

		MembersBean mBean = new MembersBeanService(session).getMemberByAccountPassword(loginAccount, loginPassword);

		tx.commit();
		if(loginAccount.equals("admin")&&loginPassword.equals("admin")) {
			
			request.getRequestDispatcher("/WebMaintain/Index_Maintain.jsp").forward(request, response);

		}else if (mBean != null) {

			request.getSession().setAttribute("loginSuccess", "登入成功");
			request.getSession().setAttribute("memberID", mBean.getId());
			request.getSession().setAttribute("memberAccount", mBean.getAccount());
			request.getSession().setAttribute("memberMail", mBean.getMail());
			request.getSession().setAttribute("memberPhone", mBean.getPhone());
			request.getSession().setAttribute("memberTrueName", mBean.getTrueName());
			request.getSession().setAttribute("memberNickName", mBean.getNickName());
			request.getSession().setAttribute("memberGender", mBean.getGender());
			request.getSession().setAttribute("memberPreferGameType", mBean.getPreferGameType());
			request.getSession().setAttribute("memberImageFileName", mBean.getImageFileName());

//			request.getRequestDispatcher("up_MemberProfilePage.jsp").forward(request,response);
//			request.getRequestDispatcher("member-profile.jsp").forward(request, response);
			response.sendRedirect("member-profile.jsp");
		} else {

			request.getSession().setAttribute("loginSuccess", "帳號或密碼錯誤");

			// request.getRequestDispatcher("up_LoginPage.jsp").forward(request, response);
			request.getRequestDispatcher("login.jsp").forward(request, response);

		}
	}
}