package joyou.Shopping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UpdateShoppingCartServlet.do")
@javax.servlet.annotation.MultipartConfig
public class UpdateShoppingCartServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ShoppingCart sc= (ShoppingCart)session.getAttribute("ShoppingCart");
		if (sc == null) {
			response.sendRedirect(getServletContext().getContextPath() + "/ShoppingPage.jsp"  );
			return;
        }
		
		String cmd = request.getParameter("cmd");
		String productsIdStr = request.getParameter("productId");
		int productId = Integer.parseInt(productsIdStr);

		
		if (cmd.equalsIgnoreCase("DEL")) {
	        sc.deleteBook(productId); 
	        RequestDispatcher rd = request.getRequestDispatcher("ShopingCartPage.jsp");
		    rd.forward(request, response);
		    return;
		} else if (cmd.equalsIgnoreCase("MOD")) {
			String newQtyStr = request.getParameter("newQty");
			int newQty = Integer.parseInt(newQtyStr.trim());
			sc.modifyQty(productId, newQty);   
	        request.getRequestDispatcher("ShopingCartPage.jsp").forward(request, response);
		    return;
		}
	}

}
