<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="shop.dto.Product" %>
<%@ page import="shop.dao.ProductRepository" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");

    if (id == null || id.trim().isEmpty()) {
        response.sendRedirect("products.jsp?error=invalid");
        return;
    }

    ProductRepository repo = new ProductRepository();
    Product product = repo.getProductById(id);

    if (product == null) {
        response.sendRedirect("products.jsp?error=notfound");
        return;
    }

    List<Product> cartList = (List<Product>) session.getAttribute("cartList");
    if (cartList == null) {
        cartList = new ArrayList<>();
    }

    boolean found = false;
    for (Product p : cartList) {
        if (p.getProductId().equals(id)) {
            p.setQuantity(p.getQuantity() + 1);
            found = true;
            break;
        }
    }

    if (!found) {
        product.setQuantity(1);
        cartList.add(product);
    }

    session.setAttribute("cartList", cartList);
    response.sendRedirect("cart.jsp");
%>
