package joyou.Shopping.Search;

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

import joyou.Products.model.ProductsBean;
import joyou.util.HibernateUtil;

@WebServlet("/ProductsSearchServlet.do")
public class ProductsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<ProductsBean> SearchResultList;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request,response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		
//		System.out.println("77777777");
		
		ProductsDao1 pDao = new ProductsDao1(session);
		String SearchInputTxt = request.getParameter("SearchInputTxt");
		SearchResultList = pDao.getSearchResultJSON(SearchInputTxt);
		
		
		
		PrintWriter out = response.getWriter(); 
		Gson gs = new Gson();
		String jsonPt = gs.toJson(SearchResultList);
		
		
		out.write(jsonPt);
		out.write("&&&");
		
//		Map<String,Integer> map = new HashMap<>();
		
//		List<ProductsBean> SearchResultList = pDao.getSearchResultJSON(SearchInputTxt);
//		out.write(gson.toJson( pDao.getSearchResultJSON(SearchInputTxt)));
		
//		out.write(gs.toJson(map));
		
		session.getTransaction().commit();
		out.close();
	}

}
