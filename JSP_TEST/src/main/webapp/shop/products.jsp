<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ include file="/layout/meta.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h1 class="display-5 fw-bold text-body-emphasis">상품 목록</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">쇼핑몰 상품 목록 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
			
				<a href="<%= root %>/shop/add.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품 등록</a>
				<a href="/shop/editProducts.jsp" class="btn btn-success btn-lg px-4 gap-3">상품 편집</a>
				<a href="/shop/cart.jsp" class="btn btn-warning btn-lg px-4 gap-3">장바구니</a>
				
			</div>
		</div>
	</div>
	<div class="container mb-5">
		<div class="row gy-4">
			
				<div class="col-md-6 col-xl-4 col-xxl-3">
					<div class="card p-3">
						<!-- 이미지 영역 -->
						<div class="img-content">
							<img src="img?id=P100001" class="w-100 p-2">
						</div>
						<!-- 컨텐츠 영역 -->
						<div class="content">
							<h3 class="text-center">자바 프로그래밍</h3>
							<p>안녕하세요 자바프로그래밍 강의입니다.</p>
							<p class="text-end price">₩ 50000</p>
							<p class="d-flex justify-content-between">
								<a href="./cart_pro.jsp?id=P100001" class="btn btn-outline-primary"><i class="material-symbols-outlined">shopping_bag</i></a>
								<a href="./product.jsp?id=P100001" class="btn btn-outline-primary">상세 정보</a>
							</p>
						</div>						
					</div>
				</div>
			
				<div class="col-md-6 col-xl-4 col-xxl-3">
					<div class="card p-3">
						<!-- 이미지 영역 -->
						<div class="img-content">
							<img src="img?id=P100002" class="w-100 p-2">
						</div>
						<!-- 컨텐츠 영역 -->
						<div class="content">
							<h3 class="text-center">오라클 데이터베이스</h3>
							<p>오라클 데이터베이스 입니다.</p>
							<p class="text-end price">₩ 20000</p>
							<p class="d-flex justify-content-between">
								<a href="./cart_pro.jsp?id=P100002" class="btn btn-outline-primary"><i class="material-symbols-outlined">shopping_bag</i></a>
								<a href="./product.jsp?id=P100002" class="btn btn-outline-primary">상세 정보</a>
							</p>
						</div>						
					</div>
				</div>
			
				<div class="col-md-6 col-xl-4 col-xxl-3">
					<div class="card p-3">
						<!-- 이미지 영역 -->
						<div class="img-content">
							<img src="img?id=P100003" class="w-100 p-2">
						</div>
						<!-- 컨텐츠 영역 -->
						<div class="content">
							<h3 class="text-center">HTML CSS JAVASCRIPT</h3>
							<p>웹 기초 강의입니다.</p>
							<p class="text-end price">₩ 15000</p>
							<p class="d-flex justify-content-between">
								<a href="./cart_pro.jsp?id=P100003" class="btn btn-outline-primary"><i class="material-symbols-outlined">shopping_bag</i></a>
								<a href="./product.jsp?id=P100003" class="btn btn-outline-primary">상세 정보</a>
							</p>
						</div>						
					</div>
				</div>
			
				<div class="col-md-6 col-xl-4 col-xxl-3">
					<div class="card p-3">
						<!-- 이미지 영역 -->
						<div class="img-content">
							<img src="img?id=P100004" class="w-100 p-2">
						</div>
						<!-- 컨텐츠 영역 -->
						<div class="content">
							<h3 class="text-center">JSP</h3>
							<p>JSP 강의입니다.</p>
							<p class="text-end price">₩ 80000</p>
							<p class="d-flex justify-content-between">
								<a href="./cart_pro.jsp?id=P100004" class="btn btn-outline-primary"><i class="material-symbols-outlined">shopping_bag</i></a>
								<a href="./product.jsp?id=P100004" class="btn btn-outline-primary">상세 정보</a>
							</p>
						</div>						
					</div>
				</div>
			
				<div class="col-md-6 col-xl-4 col-xxl-3">
					<div class="card p-3">
						<!-- 이미지 영역 -->
						<div class="img-content">
							<img src="img?id=P123123" class="w-100 p-2">
						</div>
						<!-- 컨텐츠 영역 -->
						<div class="content">
							<h3 class="text-center">고지민</h3>
							<p>고지민</p>
							<p class="text-end price">₩ 2000000</p>
							<p class="d-flex justify-content-between">
								<a href="./cart_pro.jsp?id=P123123" class="btn btn-outline-primary"><i class="material-symbols-outlined">shopping_bag</i></a>
								<a href="./product.jsp?id=P123123" class="btn btn-outline-primary">상세 정보</a>
							</p>
						</div>						
					</div>
				</div>
		</div>
	</div>
	<!-- #################### contents ########################## -->
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





