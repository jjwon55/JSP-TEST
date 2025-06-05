<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, shop.dto.Product, shop.dao.ProductRepository" %>
<%

    // 상품 ID 파라미터
    String id = request.getParameter("id");
	

    // 상품 정보를 DAO를 통해 가져오기
    ProductRepository repo = new ProductRepository();
    Product product = repo.getProductById(id);

    
    
    
    // 세션에서 장바구니 리스트(cartList) 가져오기
    List<Product> cartList = (List<Product>) session.getAttribute("cartList");
    if (cartList == null) {
        cartList = new ArrayList<>();
    }

    // 동일 상품이 이미 있는지 확인
    boolean exists = false;
    for (Product p : cartList) {
        if (p.getProductId().equals(product.getProductId())) {
            exists = true;
            break;
        }
    }

    // 장바구니에 상품이 없다면 추가
    if (!exists && product != null) {
        cartList.add(product);
    }

    // 세션에 cartList 다시 저장
    session.setAttribute("cartList", cartList);
    
    // 장바구니 페이지로 이동
    response.sendRedirect("cart.jsp");
%>
