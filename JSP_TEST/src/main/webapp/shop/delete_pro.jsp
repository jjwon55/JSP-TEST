<%@ page import="shop.dao.ProductRepository" %>
<%@ page import="java.sql.SQLException"        %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String productId = request.getParameter("id");
    String root      = request.getContextPath();        

    if (productId == null || productId.isBlank()) {
        response.sendRedirect(root + "/shop/products.jsp?error=invalidId");
        return;
    }

    ProductRepository repo = new ProductRepository();
    int deleted = 0;

    try {
        deleted = repo.delete(productId);                
    } catch (Exception e) {                          
        e.printStackTrace();
        response.sendRedirect(root + "/shop/editProduct.jsp?id=" + productId
                               + "&error=sql");
        return;
    }

    if (deleted > 0) {                                
        response.sendRedirect(root + "/shop/products.jsp?msg=deleted");
    } else {                                          
        response.sendRedirect(root + "/shop/editProduct.jsp?id=" + productId
                               + "&error=deleteFail");
    }
%>
