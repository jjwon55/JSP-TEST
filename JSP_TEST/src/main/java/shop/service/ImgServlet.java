package shop.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import shop.dao.ProductRepository;
import shop.dto.Product;

@WebServlet("/shop/img")
public class ImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext context = getServletContext();
		String uploadPath = "C:/upload/"; // 업로드 이미지 경로

		String id = request.getParameter("id");
		System.out.println("id : " + id);

		ProductRepository dao = new ProductRepository();
		Product product = dao.getProductById(id);
		String file = product.getFile(); // DB에 저장된 file 값

		String filePath;

		// 조건별 실제 파일 경로 계산
		if (file == null || file.equals("")) {
			filePath = context.getRealPath("/static/img/no-image.jpg");
		} else if (file.startsWith("/static/img")) {
			filePath = context.getRealPath(file);  // 정적 이미지 경로 처리
		} else {
			filePath = uploadPath + file;          // 업로드된 파일
		}

		System.out.println("최종 파일 경로: " + filePath);

		// MIME 타입 설정
		String ext = filePath.substring(filePath.lastIndexOf(".") + 1).toUpperCase();
		String mediaType = "image/jpeg";
		switch (ext) {
			case "JPG":
			case "JPEG": mediaType = "image/jpeg"; break;
			case "PNG" : mediaType = "image/png"; break;
			case "GIF" : mediaType = "image/gif"; break;
			case "WEBP": mediaType = "image/webp"; break;
		}
		response.setContentType(mediaType);

		// 이미지 파일 전송
		try (FileInputStream fis = new FileInputStream(filePath);
			 OutputStream out = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fis.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_NOT_FOUND); // 파일이 없으면 404 에러 응답
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
