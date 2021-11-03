package joyou.maintain;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.Products.dao.FileDao;
import joyou.Products.dao.ProductsDao;
import joyou.util.HibernateUtil;

@WebServlet("/ProductsUpdateServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ProductsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductsDao pDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		
		int pId = (int)request.getSession().getAttribute("upId");
		
		
		try {
			String name = "";
			String namestr = "";
			Integer stock = 0;
			Integer price = 0;
			String age = "";
			String agestr = "";
			Integer gametype = 0;
			String lang = "";
			String langstr = "";
			String stockstr = "";
			String pricestr = "";
			String gametypestr = "";
			String fileName = "";
			
			String suggestnum="";
			String suggestStr="";
			
			String productcolor="";
			String colorStr="";
			
			String paintingstyle="";
			String paintingStr="";
			
			String productintro="";
			String introStr="";
			
			String sale="";
			String saleStr="";
			
			long sizeInBytes = 0;
			InputStream is = null;

			Collection<Part> parts = request.getParts();
			if (parts != null) {
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);
					if (p.getContentType() == null) {
//					System.out.println(58);
						if (fldName.equals("name")) {
							namestr = value;
							name = namestr;
							request.setAttribute("name", name);
//						System.out.println(62);
						} else if (fldName.equals("stock")) {
							stockstr = value;
							stock = Integer.parseInt(stockstr);
							request.setAttribute("stock", stock);

						} else if (fldName.equals("price")) {
							pricestr = value;
							price = Integer.parseInt(pricestr);
							request.setAttribute("price", price);

						} else if (fldName.equals("age")) {
							agestr = value;
							age = agestr;
							request.setAttribute("age", age);

						} else if (fldName.equals("gametype")) {
							gametypestr = value;
							gametype = Integer.parseInt(gametypestr);
							request.setAttribute("gametype", gametype);

						} else if (fldName.equals("lang")) {
							langstr = value;
							lang = langstr;
							request.setAttribute("lang", lang);
						}else if(fldName.equals("productcolor")) {
							colorStr=value;
							productcolor=colorStr;
							request.setAttribute("productcolor", productcolor);
							
						}else if(fldName.equals("paintingstyle")) {
							paintingStr=value;
							paintingstyle=paintingStr;
							request.setAttribute("paintingstyle", paintingstyle);
							
						}else if(fldName.equals("productintro")) {
							introStr=value;
							productintro=introStr;
							request.setAttribute("productintro", productintro);
							
						}else if(fldName.equals("suggestnum")) {
							suggestStr=value;
							suggestnum=suggestStr;
							request.setAttribute("suggestnum", suggestnum);
							
						}else if(fldName.equals("sale")) {
							saleStr=value;
							sale=saleStr;
							request.setAttribute("sale", sale);
						}
						

					} else {
						fileName = FileDao.getFileName(p);
						FileDao.adjustFileName(fileName, FileDao.IMAGE_FILENAME_LENGTH);
						if (fileName != null && fileName.trim().length() > 0) {
							sizeInBytes = p.getSize();
							is = p.getInputStream();
						}
					}
				}
			}
			pDao=new ProductsDao(session);
			if (is == null) {   //假如沒有圖片資料
				pDao.updatenoImg(pId, name, stock, price, gametype, age,  lang, suggestnum, productcolor,paintingstyle,sale, productintro);
			} else {
				Blob fileBlob = FileDao.fileToBlob(is, sizeInBytes);
				pDao.update(pId, name, stock, price, gametype, age, lang, fileName, fileBlob, suggestnum, productcolor, paintingstyle,sale, productintro);
				
			}
			
			
			request.setAttribute("p", "商品更新成功!");	
			request.getRequestDispatcher("WebMaintain/Products_Update.jsp").forward(request, response);
			session.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("p", "商品更新失敗!");
			request.getRequestDispatcher("WebMaintain/Products_Update.jsp").forward(request, response);
			session.getTransaction().rollback();


		}
		session.close();
	}

}
