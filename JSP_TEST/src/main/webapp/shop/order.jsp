<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
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
	
  <div class="container-fluid">
    <a class="navbar-brand" href="/">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/shop/products.jsp">Product</a>
        </li>
      </ul>
       <ul class="navbar-nav d-flex align-items-center px-3">
       	
       	<!-- 비로그인 시 -->
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/user/login.jsp">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/user/join.jsp">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/user/order.jsp">주문내역</a>
        </li>
        
        <li class="nav-item">
	        <a class="nav-link position-relative" aria-current="page" href="/shop/cart.jsp">
	        	<i class="material-symbols-outlined">shopping_bag</i>
	        	<span class="cart-count">0</span>
	        </a>
        </li>
      </ul>
      <form class="d-flex" role="search" action="/shop/products.jsp" method="get">
        <input class="form-control me-2" type="search" name="keyword" placeholder="Search" aria-label="Search" value="">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>





	
	<div class="row m-0 mypage">
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <!-- 로그인 시 -->
			      
			      
			      <li>
			        <a href="#" class="nav-link active" aria-current="page">
			          주문내역
			        </a>
			      </li>
			    </ul>
			    <hr>
			  </div>
		</div>
		
		<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
				<h1 class="display-5 fw-bold text-body-emphasis">주문 내역</h1>
				<div class="col-lg-6 mx-auto">
						
						<p class="lead mb-4">비회원 주문하신 경우, 전화번호와 주문 비밀번호를 입력해주세요.</p>
					
				</div>
			</div>
			
			<!-- 주문 내역 영역 -->
			<div class="container shop m-auto mb-5">
					<form action="/user/order_pro.jsp" method="post">
					
						<div class="mb-5">
							<table class="table">
								<tbody><tr>
									<td>전화번호 :</td>
									<td>
										<input type="text" class="form-control" name="phone" placeholder="- 생략하고 숫자만 입력해주세요.">
									</td>
								</tr>
								<tr>
									<td>주문 비밀번호 :</td>
									<td>
										<input type="password" class="form-control" name="orderPw" placeholder="주문 비밀번호를 입력해주세요.">
									</td>
								</tr>
							</tbody></table>
							<div class="btn-box d-grid gap-2">
								<button type="submit" class="btn btn-outline-primary btn-lg px-4 gap-3">조회</button>
							</div>
						</div>
					
					</form>
				
			</div>
			
			
<footer class="container p-5">
	<p class="text-center">Copyright ⓒ ALOHA CLASS. All Rights Reserved</p>
</footer>
		</div>
	</div>
	
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="../static/js/validation.js"></script> -->			<!-- 상대경로 -->
	<!-- 절대경로 -->
<script src="/static/js/validation.js"></script>





	
	

	<script>
		
		let form = document.updateForm
		
		// 성별 선택
		let tempGender = document.getElementById('temp-gender')
		let radioFemale = document.getElementById('gender-female')
		let radioMale = document.getElementById('gender-male')
		// alert(tempGender.value)
		if( tempGender.value == '남' )		radioMale.checked = true
		if( tempGender.value == '여' )		radioFemale.checked = true
		
		
		// 생일 월 (select) 선택
		let tempMonth = document.getElementById('temp-month')
		let selectMonth = form.month
		selectMonth.value = tempMonth.value
		
		
		// 메일 도메인 (select) 선택
		let tempEmail2 = document.getElementById('temp-email2')
		let selectEmail2 = form.email2
		selectEmail2.value = tempEmail2.value
		
		
		// 탈퇴 체크
		function alertDel() {

			let form = document.updateForm

			let check = confirm('정말 탈퇴하시겠습니까?')

			if( check ) {
				form.action = 'delete.jsp'
				form.submit()
			}

		}
	
	</script>










	
	<!-- #################### contents ########################## -->
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





