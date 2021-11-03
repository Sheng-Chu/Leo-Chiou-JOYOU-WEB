package joyou.Members.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

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
@WebServlet("/up_MemberRegisterServlet")
public class MemberRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
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

		userAccount = request.getParameter("userAccount");
		userPassword = request.getParameter("userPassword");
		userMail = request.getParameter("userMail");
		userNickName = request.getParameter("userNickName");
		userGender = request.getParameter("userGender");

		userTrueName = request.getParameter("userTrueName");
		userPhone = request.getParameter("userPhone");

		userGender = request.getParameter("userGender");
		userPreferGameType = Integer.valueOf(request.getParameter("userPreferGameType"));

		// 感覺後端需要再次驗證資料,有空再補
		System.out.println("userAccount= " + userAccount);
		System.out.println("userMail= " + userMail);
		System.out.println("userGender= " + userGender);
		System.out.println("userPreferGameType= " + userPreferGameType);


		// imgName是空的就表示沒有上傳檔案
		Part uploadPart = request.getPart("userPicture");
		String uploadFileName = uploadPart.getSubmittedFileName();
		String userImageFileName;
		if (!uploadFileName.isEmpty()) {
			userImageFileName = userAccount
					+ uploadFileName.substring(uploadFileName.lastIndexOf("."), uploadFileName.length());
			try (InputStream in = uploadPart
					.getInputStream();
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
			userImageFileName = userAccount + ".jpg";
			try (InputStream in = new FileInputStream(
					"C:\\WorkDataSource\\workspace\\JoYouProject\\WebContent\\up_NoUsed\\" + "pic.jpg");
					OutputStream out = new FileOutputStream(
							"C:\\WorkDataSource\\workspace\\JoYouProject\\WebContent\\up_NoUsed\\"
									+ userImageFileName)) {
				byte[] buffer = new byte[1024];
				int length = -1;
				while ((length = in.read(buffer)) != -1) {
					out.write(buffer, 0, length);
				}
			}
		}



		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();

		MembersBeanService mService = new MembersBeanService(session);
		mService.insert(new MembersBean(userAccount, userPassword, userMail, userNickName, userTrueName, userPhone,
				userGender, userPreferGameType, userImageFileName, null));

		tx.commit();
		session.close();

		String randInt = new TestMail().sendMail(userMail);

		request.getSession().setAttribute("registerSuccess", "註冊成功請登入");
		request.getSession().setAttribute("memberNickName", userNickName);
		request.getSession().setAttribute("memberMail", userMail);

		request.getSession().setAttribute("VerifiedCode", randInt);
		// request.getRequestDispatcher("up_LoginPage.jsp").forward(request, response);
		request.getRequestDispatcher("member-into-3.jsp").forward(request, response);

	}

}
