<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="shop.dao.ProductRepository" %>
<%@ page import="shop.dto.Product" %>
<%@ include file="/layout/meta.jsp" %>
<%
    ProductRepository repo = new ProductRepository();
    List<Product> products = repo.list();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shop</title>
    <jsp:include page="/layout/meta.jsp" />
    <jsp:include page="/layout/link.jsp" />
</head>
<body>
    <jsp:include page="/layout/header.jsp" />

    <div class="px-4 py-5 my-5 text-center">
        <h1 class="display-5 fw-bold text-body-emphasis">상품 목록</h1>
        <div class="col-lg-6 mx-auto">
            <p class="lead mb-4">쇼핑몰 상품 목록 입니다.</p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                <a href="<%= root %>/shop/add.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품 등록</a>
                <a href="<%= root %>/shop/editProducts.jsp" class="btn btn-success btn-lg px-4 gap-3">상품 편집</a>
                <a href="<%= root %>/shop/cart.jsp" class="btn btn-warning btn-lg px-4 gap-3">장바구니</a>
            </div>
        </div>
    </div>

    <div class="container mb-5">
        <div class="row gy-4">
            <%
                for (Product p : products) {
            %>
                <div class="col-md-6 col-xl-4 col-xxl-3">
                    <div class="card p-3">
                        <div class="img-content">
                            <img src="img?id=<%= p.getProductId() %>" class="w-100 p-2">
                        </div>
                        <div class="content">
                            <h3 class="text-center"><%= p.getName() %></h3>
                            <p><%= p.getDescription() %></p>
                            <p class="text-end price">₩ <%= p.getUnitPrice() %></p>
                            <p class="d-flex justify-content-between">
                                <a href="./cart_pro.jsp?id=<%= p.getProductId() %>" class="btn btn-outline-primary">
                                    <i class="material-symbols-outlined">shopping_bag</i>
                                </a>
                                <a href="./product.jsp?id=<%= p.getProductId() %>" class="btn btn-outline-primary">상세 정보</a>
                            </p>
                        </div>
                    </div>
                </div>
            <%
                }
            %>
        </div>
    </div>

    <jsp:include page="/layout/footer.jsp" />
    <jsp:include page="/layout/script.jsp" />
</body>
</html>
