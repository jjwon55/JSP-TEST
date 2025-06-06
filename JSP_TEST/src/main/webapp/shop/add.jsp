<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 등록</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
<jsp:include page="/layout/header.jsp" />

<div class="container my-5 shop">
	<h1 class="text-center mb-5">상품 등록</h1>

	<form name="product" action="./add_pro.jsp" method="post" onsubmit="return checkProduct()" enctype="multipart/form-data">
		
		<!-- 이미지 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-2">상품 이미지</label>
			<input type="file" class="form-control col-md-10" name="file">
		</div>	

		<!-- 상품 코드 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-2">상품 코드</label>
			<input type="text" class="form-control col-md-10" name="productId" required>
		</div>

		<!-- 상품명 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-2">상품명</label>
			<input type="text" class="form-control col-md-10" name="name" required>
		</div>

		<!-- 가격 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-2">가격</label>
			<input type="number" class="form-control col-md-10" name="unitPrice" required>
		</div>

		<!-- 상세 정보 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text w-100">상세 정보</label>
			<textarea class="form-control" name="description" style="height: 200px !important;"></textarea>
		</div>

		<!-- 제조사 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-2">제조사</label>
			<input type="text" class="form-control col-md-10" name="manufacturer">
		</div>

		<!-- 분류 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-2">분류</label>
			<input type="text" class="form-control col-md-10" name="category">
		</div>

		<!-- 재고 수 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-2">재고 수</label>
			<input type="number" class="form-control col-md-10" name="unitsInStock" required>
		</div>

		<!-- 상태 -->
		<div class="input-group mb-3 row">
			<div class="col-md-2 p-0">
				<label class="input-group-text">상태</label>
			</div>
			<div class="col-md-10 d-flex align-items-center">
				<div class="radio-box d-flex">
					<div class="radio-item mx-5">
						<input type="radio" class="form-check-input" name="condition" value="NEW" id="condition-new"> 
						<label for="condition-new">신규 제품</label>
					</div>
					<div class="radio-item mx-5">
						<input type="radio" class="form-check-input" name="condition" value="OLD" id="condition-old"> 
						<label for="condition-old">중고 제품</label>
					</div>
					<div class="radio-item mx-5">
						<input type="radio" class="form-check-input" name="condition" value="RE" id="condition-re"> 
						<label for="condition-re">재생 제품</label>
					</div>
				</div>
			</div>
		</div>

		<!-- 버튼 -->
		<div class="d-flex justify-content-between mt-5 mb-5">
			<a href="./products.jsp" class="btn btn-lg btn-secondary">목록</a>
			<input type="submit" class="btn btn-lg btn-primary" value="등록">
		</div>
	</form>
</div>

<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp" />
<script src="/static/js/validation.js"></script>
</body>
</html>
