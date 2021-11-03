package joyou.Members.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanService;
import joyou.util.HibernateUtil;

@MultipartConfig
@WebServlet("/up_MemberEditProfileServlet")
public class MemberEditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String userAccount = request.getParameter("userAccount");
		String userMail = request.getParameter("userMail");
		String userNickName = request.getParameter("userNickName");
		String userTrueName = request.getParameter("userTrueName");
		String userPhone = request.getParameter("userPhone");
		String userGender = request.getParameter("userGender");
		System.out.println("account= " + userAccount);
		System.out.println("nickname= " + userNickName);

		System.out.println("request.getParameter(userPreferGameType)");
		System.out.println(request.getParameter("userPreferGameType"));
		Integer userPreferGameType = Integer.valueOf(request.getParameter("userPreferGameType"));


		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();

		Part uploadPart = request.getPart("userPicture");
		String uploadFileName = uploadPart.getSubmittedFileName();
		String userImageFileName;
		if (!uploadFileName.isEmpty()) {
			userImageFileName = userAccount
					+ uploadFileName.substring(uploadFileName.lastIndexOf("."), uploadFileName.length());
			try (InputStream in = uploadPart.getInputStream();
					OutputStream out = new FileOutputStream(
							"C:\\WorkDataSource\\workspace\\JoYouProject\\WebContent\\up_NoUsed\\"
									+ userImageFileName)) {
				byte[] buffer = new byte[1024];
				int length = -1;
				while ((length = in.read(buffer)) != -1) {
					out.write(buffer, 0, length);
				}
			}
		} else {
			userImageFileName = new MembersBeanService(session).getMemberByAccount(userAccount).getImageFileName();
		}


		System.out.println("userImageFileName= " + userImageFileName);

		boolean UpdateSuccess = new MembersBeanService(session).update(
				new MembersBean(userAccount, null, null, userNickName, userTrueName, userPhone, userGender,
						userPreferGameType, userImageFileName, null));

		tx.commit();

		if (UpdateSuccess) {

			request.getSession().setAttribute("UpdateSuccess", "更新會員資料成功");

			request.getSession().setAttribute("memberAccount", userAccount);
			request.getSession().setAttribute("memberMail", userMail);
			request.getSession().setAttribute("memberPhone", userPhone);
			request.getSession().setAttribute("memberTrueName", userTrueName);
			request.getSession().setAttribute("memberNickName", userNickName);
			request.getSession().setAttribute("memberGender", userGender);
			request.getSession().setAttribute("memberPreferGameType", userPreferGameType);
			request.getSession().setAttribute("memberImageFileName", userImageFileName);

//			request.getRequestDispatcher("up_MemberProfilePage.jsp").forward(request, response);
//			request.getRequestDispatcher("member-profile.jsp").forward(request, response);
			response.sendRedirect("member-profile.jsp");
		} else {

			request.getSession().setAttribute("UpdateSuccess", "更新會員資料失敗");
//			request.getRequestDispatcher("up_MemberProfilePage.jsp").forward(request, response);
			request.getRequestDispatcher("member-profile.jsp").forward(request, response);

		}

	}

}