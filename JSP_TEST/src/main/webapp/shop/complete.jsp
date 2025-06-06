<%@page import="shop.dto.Order"%>
<%@page import="java.util.UUID"%>
<%@page import="shop.dto.Ship"%>
<%@page import="shop.dao.ProductIORepository"%>
<%@page import="shop.dao.OrderRepository"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ include file="/layout/meta.jsp" %>
<%@ include file="/layout/link.jsp" %>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<%
	Ship ship = (Ship)session.getAttribute("ship");
	String loginId = (String)session.getAttribute("loginId");
	List<Product> list = (List<Product>)session.getAttribute("cartList");
	OrderRepository orderRepository = new OrderRepository();
	ProductRepository productRepository = new ProductRepository();
	ProductIORepository productIoRepository = new ProductIORepository();
	String cartId = UUID.randomUUID().toString();
	
	if (ship == null || list == null || list.isEmpty()) {
        response.sendRedirect("ship.jsp");
        return;
    }
	
	
	int total = 0;

    for (Product cart : list) {
		int subTotal = cart.getUnitPrice() * cart.getQuantity();
		total += subTotal;
    }
	
	Order order = null;
	String orderPw = request.getParameter("orderPw");
	if(orderPw != null && !orderPw.equals("")) {
		order = Order.builder().cartId(cartId)
							   .shipName(ship.getShipName())
							   .zipCode(ship.getZipCode())
							   .country(ship.getCountry())
							   .address(ship.getAddress())
							   .orderPw(orderPw)
							   .totalPrice(total)
							   .phone(ship.getPhone())
							   .build();
							   
		orderRepository.insert(order);
	
		


		int orderNo = orderRepository.lastOrderNo(ship.getPhone(), orderPw);
		for(Product cartList : list) {
			Product product = Product.builder()
									 .productId(cartList.getProductId())
									 .quantity(cartList.getQuantity())
									 .type("OUT")
									 .build();
			
			productIoRepository.insert(product);
		}
	} else {
		order = Order.builder().cartId(cartId)
						       .shipName(ship.getShipName())
				   		       .zipCode(ship.getZipCode())
						       .country(ship.getCountry())
						       .address(ship.getAddress())
						       .totalPrice(total)
						       .userId(loginId)
						       .build();

				orderRepository.insert(order);
				
				int orderNo = orderRepository.lastOrderNo((String)session.getAttribute("loginId"));
					for(Product cartList : list) {
						Product product = Product.builder().productId(cartList.getProductId())
														   .quantity(cartList.getQuantity())
														   .type("OUT") 
														   .userId((String)session.getAttribute("loginId"))
														   .build();
							
						productIoRepository.insert(product);
					}
	}		
			
	list.clear();
	session.removeAttribute("cartList");
    session.removeAttribute("ship");

	
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
		<h1 class="display-5 fw-bold text-body-emphasis">주문 완료</h1>
	</div>
	
	<!-- 주문 완료 확인 -->
	
	<div class="container order mb-5 p-5">
		
		<h2 class="text-center">주문이 완료되었습니다.</h2>
		<!-- 주문정보 -->
		<div class="ship-box">
			<table class="table ">
				<tbody><tr>
					<td>주문번호 :</td>
					<td><%= cartId %></td>
				</tr>
				<tr>
					<td>배송지 :</td>
					<td><%= ship.getAddress() %></td>
				</tr>
			</tbody></table>
			
			<div class="btn-box d-flex justify-content-center">
				<a href="<%= root %>/user/order.jsp" class="btn btn-primary btn-lg px-4 gap-3">주문내역</a>
			</div>
		</div>
	</div>
	
	
<jsp:include page="/layout/footer.jsp" />
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="../static/js/validation.js"></script> -->			<!-- 상대경로 -->
	<!-- 절대경로 -->
<script src="/static/js/validation.js"></script>
</body>
</html>