<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="shop.dao.ProductRepository" %>
<%@ page import="shop.dto.Product" %>

<%
	String id = request.getParameter("id");
	ProductRepository repo = new ProductRepository();
	Product p = repo.getProductById(id);
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop - <%= p != null ? p.getName() : "상품 없음" %></title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>

	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">상품 정보</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="./products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
			</div>
		</div>
	</div>

	<% if (p != null) { %>
	<!-- 상품 정보 출력 -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="img?id=<%= p.getProductId() %>" class="w-100 p-2">
			</div>
			<div class="col-md-6">
				<h3 class="mb-5"><%= p.getName() %></h3>
			 	<table class="table">
			 		<colgroup>
			 			<col width="120px"><col>
			 		</colgroup>
			 		<tbody>
			 			<tr><td>상품ID :</td><td><%= p.getProductId() %></td></tr>
			 			<tr><td>제조사 :</td><td><%= p.getManufacturer() %></td></tr>
			 			<tr><td>분류 :</td><td><%= p.getCategory() %></td></tr>
			 			<tr><td>상태 :</td><td><%= p.getCondition() %></td></tr>
			 			<tr><td>재고 수 :</td><td><%= p.getUnitsInStock() %></td></tr>
			 			<tr><td>가격 :</td><td>₩ <%= p.getUnitPrice() %></td></tr>
			 		</tbody>
			 	</table>
			 	<div class="mt-4">
					<form name="addForm" action="./addCart.jsp" method="post">
						<input type="hidden" name="id" value="<%= p.getProductId() %>">
						<div class="btn-box d-flex justify-content-end">
							<a href="./cart.jsp" class="btn btn-lg btn-warning mx-3">장바구니</a>
							<a href="javascript:;" class="btn btn-lg btn-success mx-3" onclick="addToCart()">주문하기</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<% } else { %>
	<!-- 상품 없을 경우 -->
	<div class="container text-center">
		<h4>해당 상품을 찾을 수 없습니다.</h4>
	</div>
	<% } %>

	<footer class="container p-5">
		<p class="text-center">Copyright ⓒ ALOHA CLASS. All Rights Reserved</p>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/static/js/validation.js"></script>

	<script>
		function addToCart() {
			if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
				document.addForm.submit();
			} else {
				document.addForm.reset();
			}
		}
	</script>

	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
