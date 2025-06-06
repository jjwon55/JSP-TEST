<%@page import="java.util.Iterator" %>
<%@page import="org.apache.commons.fileupload2.jakarta.*" %>
<%@page import="org.apache.commons.fileupload2.core.*" %>
<%@page import="java.nio.charset.StandardCharsets" %>
<%@page import="java.io.FileOutputStream" %>
<%@page import="java.io.InputStream" %>
<%@page import="java.io.File" %>
<%@page import="java.util.List" %>
<%@page import="jakarta.servlet.ServletContext" %>
<%@page import="shop.dto.Product" %>
<%@page import="shop.dao.ProductRepository" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");

	String uploadPath = "C:/upload/";
	File uploadDir = new File(uploadPath);
	if (!uploadDir.exists()) {
		uploadDir.mkdirs();
	}

	File repository = new File(System.getProperty("java.io.tmpdir"));
	FileItemFactory<DiskFileItem> factory = DiskFileItemFactory.builder().setFile(repository).get();
	JakartaServletFileUpload<DiskFileItem, FileItemFactory<DiskFileItem>> upload = new JakartaServletFileUpload<>(factory);
	JakartaServletRequestContext contextUpload = new JakartaServletRequestContext(request);

	String productId = null, name = null, description = null, manufacturer = null, category = null, condition = null, fileName = null;
	int unitPrice = 0, unitsInStock = 0;

	try {
		List<DiskFileItem> items = upload.parseRequest(contextUpload);
		for (DiskFileItem item : items) {
			if (item.isFormField()) {
				String fieldName = item.getFieldName();
				String value = item.getString(StandardCharsets.UTF_8);

				switch (fieldName) {
					case "productId": productId = value; break;
					case "name": name = value; break;
					case "description": description = value; break;
					case "manufacturer": manufacturer = value; break;
					case "category": category = value; break;
					case "condition": condition = value; break;
					case "unitPrice": unitPrice = Integer.parseInt(value); break;
					case "unitsInStock": unitsInStock = Integer.parseInt(value); break;
				}
			} else {
				String originalName = item.getName();
				if (originalName != null && !originalName.equals("")) {
					fileName = System.currentTimeMillis() + "_" + originalName;
					File uploadedFile = new File(uploadDir, fileName);

					try (
						InputStream is = item.getInputStream();
						FileOutputStream fos = new FileOutputStream(uploadedFile);
					) {
						is.transferTo(fos);
					}
				}
			}
		}

		Product product = new Product();
		product.setProductId(productId);
		product.setName(name);
		product.setDescription(description);
		product.setManufacturer(manufacturer);
		product.setCategory(category);
		product.setCondition(condition);
		product.setUnitPrice(unitPrice);
		product.setUnitsInStock(unitsInStock);
		product.setFile(fileName); 

		ProductRepository repo = new ProductRepository();
		int result = repo.insert(product);

		if (result > 0) {
			response.sendRedirect("products.jsp");
		} else {
			out.println("<script>alert('상품 등록 실패'); history.back();</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>alert('에러 발생: " + e.getMessage() + "'); history.back();</script>");
	}
%>
