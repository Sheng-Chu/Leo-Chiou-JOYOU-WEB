package joyou.friends.Recommend;

import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.util.HibernateUtil;

@WebServlet("/FriendsInsert.do")
@javax.servlet.annotation.MultipartConfig
public class FriendsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

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
		
		try {
		Integer memID = 0;
		Integer friID = 0;
		
		String memIDStr="";
		String friIDStr="";
			
//		String name = "";
//		String namestr = "";
//		Integer stock = 0;
//		Integer price = 0;
//		String age = "";
//		String agestr = "";
//		Integer gametype = 0;
//		String lang = "";
//		String langstr = "";
//		String stockstr="";
//		String pricestr="";
//		String fileName="";
//		String gametypestr="";
//		
//		String suggestnum="";
//		String suggestStr="";
//		
//		String productcolor="";
//		String colorStr="";
//		
//		String paintingstyle="";
//		String paintingStr="";
//		
//		String productintro="";
//		String introStr="";
//		
//		
//		String sale="";
//		String saleStr="";
//		long sizeInBytes = 0;
//		InputStream is = null;

		Collection<Part> parts = request.getParts();
		if (parts != null) {
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);
				if (p.getContentType() == null) {
					if (fldName.equals("memID")) {    
						memIDStr=value;
						memID = Integer.parseInt(memIDStr);
						request.setAttribute("memID", memID);
					} else if (fldName.equals("friID")) {
						friIDStr=value;
						friID = Integer.parseInt(friIDStr);
						request.setAttribute("friID", friID);
						
				}else {
//					fileName=FileDao.getFileName(p);
//					FileDao.adjustFileName(fileName, FileDao.IMAGE_FILENAME_LENGTH);
//					if (fileName != null && fileName.trim().length() > 0) {
//						sizeInBytes = p.getSize();
//						is = p.getInputStream();

				
					}
				}
			}
		}
		
		
//		Blob fileBlob = FileDao.fileToBlob(is, sizeInBytes);   
		FriendsRecommendBean fBean = new FriendsRecommendBean(memID, friID);
		TTTTTTTTTTestFFFFFFFFFriendDao fDao = new TTTTTTTTTTestFFFFFFFFFriendDao(session);
		FriendsRecommendBean bean = fDao.insert(fBean);   //存資料庫
		
		
		
//		String imgName = bean.getImgName();     //存本地
//		Blob Img = bean.getProductImg();
//		InputStream isImg = Img.getBinaryStream();
//		byte[] bs = new byte[isImg.available()];
//		isImg.read(bs);
//		FileOutputStream fos=new FileOutputStream("C:\\share\\SpringSource\\springworkspace\\JoYouProject\\WebContent\\img\\"+imgName+"");
////		FileOutputStream fos=new FileOutputStream("C:\\WorkDataSource\\workspace\\JoYouProject\\WebContent\img\\"+imgName+"");
//		fos.write(bs);
//		fos.close();
		
		
		request.setAttribute("InsertMsg", "好友加入成功!");
		request.getRequestDispatcher("AlreadyFriendDetail.jsp").forward(request, response);
		session.getTransaction().commit();
		
		}catch(Exception e) {
			e.printStackTrace();
		request.setAttribute("InsertMsg", "失敗!");
		request.getRequestDispatcher("FriendDetail.jsp").forward(request, response);
		session.getTransaction().rollback();
		}
		
		
	}

}
