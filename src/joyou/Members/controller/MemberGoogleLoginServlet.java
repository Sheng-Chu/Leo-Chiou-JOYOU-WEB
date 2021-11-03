package joyou.Members.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanService;
import joyou.util.HibernateUtil;


@WebServlet("/MemberGoogleLoginServlet")
public class MemberGoogleLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userAccount;
	private String userPassword;
	private String userMail;
	private String userNickName;

	private String userTrueName;
	private String userPhone;

	private String userGender;
	private Integer userPreferGameType;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");


		String mail = request.getParameter("mail");
		System.out.println(mail);


		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();

		MembersBeanService mService = new MembersBeanService(session);
		MembersBean mBean = mService.getMemberByMail(mail);

		tx.commit();
		session.close();

		request.getSession().setAttribute("loginSuccess", "success");
		request.getSession().setAttribute("memberID", mBean.getId());
		request.getSession().setAttribute("memberAccount", mBean.getAccount());
		request.getSession().setAttribute("memberMail", mBean.getMail());
		request.getSession().setAttribute("memberPhone", mBean.getPhone());
		request.getSession().setAttribute("memberTrueName", mBean.getTrueName());
		request.getSession().setAttribute("memberNickName", mBean.getNickName());
		request.getSession().setAttribute("memberGender", mBean.getGender());
		request.getSession().setAttribute("memberPreferGameType", mBean.getPreferGameType());
		request.getSession().setAttribute("memberImageFileName", mBean.getImageFileName());
		System.out.println("nickname=" + mBean.getNickName());


		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		Map<String, String> map = new HashMap<>();
		map.put("loginSuccess", "success");
		out.println(gson.toJson(map));
		out.close();



	}

}
