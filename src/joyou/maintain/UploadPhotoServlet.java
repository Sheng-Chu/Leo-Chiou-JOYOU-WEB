package joyou.maintain;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UncheckedIOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/Upload")
public class UploadPhotoServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	int page;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8"); // 處理中文檔名
		page = 0;
		request.getParts().stream().filter(part -> !"upload".equals(part.getName()) && part.getSize() > 0)
				.forEach(this::write);
//		request.setAttribute("Msg", "上傳成功!!!");
//		request.getRequestDispatcher("/WebMaintain/SlideshowEdit.jsp").forward(request, response);
		response.sendRedirect("/JoYouProject/WebMaintain/SlideshowSuccess.jsp");
	}

	public void write(Part part)
	{
		page += 1;
		String fileName = part.getSubmittedFileName();

		if (!fileName.isEmpty())
		{
			File file = new File(
					"C:\\share\\datasource\\SpringSource\\springworkspace\\JoYouProject\\WebContent\\img\\"
							+ fileName);
			String newFileName = "index" + page + ".jpg";
			File newFile = new File(
					"C:\\share\\datasource\\SpringSource\\springworkspace\\JoYouProject\\WebContent\\img\\"
							+ newFileName);
			file.renameTo(newFile);

			try
			{
				InputStream in = part.getInputStream();
				OutputStream out = new FileOutputStream(newFile);
				byte[] buffer = new byte[1024];
				int length = -1;
				while ((length = in.read(buffer)) != -1)
				{
					out.write(buffer, 0, length);
				}

			} catch (IOException e)
			{
				throw new UncheckedIOException(e);
			}
		}
	}

}
