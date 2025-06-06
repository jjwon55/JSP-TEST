<%@page import="shop.dto.Ship"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <% 
 	String loginId = (String) session.getAttribute("loginId");
 	Ship ship = (Ship)session.getAttribute("ship");
    List<Product> cartList = (List<Product>) session.getAttribute("cartList");
    int total=0;
	int count=0;
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
	<!-- #################### contents ########################## -->

	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 정보</h1>
	</div>
	
	<!-- 주문 확인 영역 -->
	<div class="container order mb-5">
		<form action="complete.jsp" method="post">
		<!-- 배송정보 -->
		<div class="ship-box">
			<table class="table ">
				<tbody><tr>
					<td>주문 형태 :</td>
					<td><%= loginId != null ? "회원 주문" : "비회원 주문" %></td>
				</tr>
				<tr>
				    <td>성 명 :</td>
				    <td><%= ship.getShipName() %></td>
				</tr>
				<tr>
				    <td>우편번호 :</td>
				    <td><%= ship.getZipCode() %></td>
				</tr>
				<tr>
				    <td>주소 :</td>
				    <td><%= ship.getAddress() %></td>
				</tr>
				<tr>
				    <td>배송일 :</td>
				    <td><%= ship.getDate() %></td>
				</tr>
				<tr>
				    <td>전화번호 :</td>
				    <td><%= ship.getPhone() %></td>
				</tr>
				<%if(loginId == null) { %>
				<tr>
					<td>주문 비밀번호 :</td>
					<td>
						<input type="password" class="form-control" name="orderPw">
					</td>
				</tr>
				<%} %>
			</tbody></table>
		</div>
		
		<!-- 주문목록 -->
		<div class="cart-box">
			<table class="table table-striped table-hover table-bordered text-center align-middle">
				<thead>
					<tr class="table-primary">
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<% for(Product cart : cartList) {%>
					<% 
						int subTotal = cart.getUnitPrice() * cart.getQuantity();
						total += subTotal;
						count += cart.getQuantity();
					%>
					<tr>
						<td><%= cart.getName() %></td>
						<td><%= cart.getUnitPrice() %></td>
						<td><%= cart.getQuantity() %></td>
						<td><%= subTotal %></td>			
					</tr>
					<% } %>
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td></td>
						<td>총액</td>
						<td><%= total %></td>
					</tr>
				</tfoot>
			</table>
	
		</div>
		
		<!-- 버튼 영역 -->
		<div class="d-flex justify-content-between mt-5 mb-5">
			<div class="item">
				<a href="ship.jsp" class="btn btn-lg btn-success">이전</a>
				<!-- 취소 프로세스는 이어서... -->				
				<a href="" class="btn btn-lg btn-danger">취소</a>				
			</div>
			<div class="item">
				<input type="hidden" name="login" value="false">
				<input type="hidden" name="totalPrice" value="40000">
				<input type="submit" class="btn btn-lg btn-primary" value="주문완료">	
			</div>
		</div>
		</form>
	</div>
	
	
<footer class="container p-5">
	<p class="text-center">Copyright ⓒ ALOHA CLASS. All Rights Reserved</p>
</footer>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="../static/js/validation.js"></script> -->			<!-- 상대경로 -->
	<!-- 절대경로 -->
<script src="/static/js/validation.js"></script>


	<!-- #################### contents ########################## -->
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





