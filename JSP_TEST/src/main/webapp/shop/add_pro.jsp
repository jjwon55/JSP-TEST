<%@ page import="shop.dto.Product" %>
<%@ page import="shop.dao.ProductRepository" %>
<%@ page import="java.io.File" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    // 업로드 경로 준비
    String uploadPath = application.getRealPath("/upload");
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) uploadDir.mkdirs();

    // 파일 업로드 처리
    String savedFileName = "";
    try {
        Part part = request.getPart("file");
        if (part != null && part.getSize() > 0) {
            String fileName = part.getSubmittedFileName();
            File saveFile = new File(uploadPath, fileName);
            part.write(saveFile.getAbsolutePath());
            savedFileName = fileName;
        }
    } catch (Exception e) {
        savedFileName = ""; // 파일 없어도 등록 가능
    }

    // 파라미터 수집
    String productId = request.getParameter("product_id");
    String name = request.getParameter("name");

    int unitPrice = 0;
    String unitPriceParam = request.getParameter("unitPrice");
    if (unitPriceParam != null && !unitPriceParam.isEmpty()) {
        try {
            unitPrice = Integer.parseInt(unitPriceParam);
        } catch (NumberFormatException e) {
            unitPrice = 0;
        }
    }

    String description = request.getParameter("description");
    String manufacturer = request.getParameter("manufacturer");
    String category = request.getParameter("category");

    int unitsInStock = 0;
    String stockParam = request.getParameter("unitsInStock");
    if (stockParam != null && !stockParam.isEmpty()) {
        try {
            unitsInStock = Integer.parseInt(stockParam);
        } catch (NumberFormatException e) {
            unitsInStock = 0;
        }
    }

    String condition = request.getParameter("condition");

    // DTO에 저장
    Product product = new Product();
    product.setProductId(productId);
    product.setName(name);
    product.setUnitPrice(unitPrice);
    product.setDescription(description);
    product.setManufacturer(manufacturer);
    product.setCategory(category);
    product.setUnitsInStock(unitsInStock);
    product.setCondition(condition);
    product.setFile(savedFileName);
    product.setQuantity(0); // 장바구니 기본값

    // DAO 등록
    ProductRepository repo = new ProductRepository();
    int result = repo.insert(product);

    // 결과 처리
    if (result > 0) {
        response.sendRedirect("product.jsp");
    } else {
        response.sendRedirect("add.jsp?error=fail");
    }
%>
