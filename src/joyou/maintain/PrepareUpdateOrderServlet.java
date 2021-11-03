package joyou.maintain;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import joyou.Members.model.MembersBeanDao;
import joyou.Orders.dao.OrdersDao;
import joyou.util.HibernateUtil;


@WebServlet("/PrepareUpdateOrderServlet.do")
@javax.servlet.annotation.MultipartConfig
public class PrepareUpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		int Id = Integer.parseInt(request.getParameter("OrderId"));
		OrdersDao oDao = new OrdersDao(session);
		MembersBeanDao mBean = new MembersBeanDao(session);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(oDao.selectbyId(Id).getOrderDate());
		request.setAttribute("updiscode", oDao.selectbyId(Id).getDiscount());
		request.setAttribute("upAmount", oDao.selectbyId(Id).getOrderAmount());
		request.setAttribute("upRemarks", oDao.selectbyId(Id).getRemarks());
		request.setAttribute("upDate",  date);
		request.setAttribute("upPay", oDao.selectbyId(Id).getPayMethod());
		request.setAttribute("upReceiver", oDao.selectbyId(Id).getReceiver());
		request.setAttribute("upReceiverPhone", oDao.selectbyId(Id).getReceiverPhone());
		request.setAttribute("upAddress", oDao.selectbyId(Id).getShippingAddress());
		
		request.setAttribute("upOrderName", mBean.getMemberById(oDao.selectbyId(Id).getMemberId()).getTrueName());
		request.setAttribute("upOrderPhone", mBean.getMemberById(oDao.selectbyId(Id).getMemberId()).getPhone());
		
		
		
		
		
		
		request.getSession().setAttribute("OrderNum", Id);
		request.getRequestDispatcher("WebMaintain//Orders_Update.jsp").forward(request, response);
		
		session.getTransaction().commit();
	}

}
