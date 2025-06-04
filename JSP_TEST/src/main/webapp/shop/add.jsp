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

<div class="container my-5">
	<h1 class="text-center">상품 등록</h1>

	<form action="add_pro.jsp" method="post" enctype="multipart/form-data">
		<!-- 이미지 -->
		<div class="mb-3">
			<label class="form-label">상품 이미지</label>
			<input type="file" class="form-control" name="file">
		</div>

		<!-- 상품 코드 -->
		<div class="mb-3">
			<label class="form-label">상품 코드</label>
			<input type="text" class="form-control" name="productId" required>
		</div>

		<!-- 상품명 -->
		<div class="mb-3">
			<label class="form-label">상품명</label>
			<input type="text" class="form-control" name="name" required>
		</div>

		<!-- 가격 -->
		<div class="mb-3">
			<label class="form-label">가격</label>
			<input type="number" class="form-control" name="unitPrice" required>
		</div>

		<!-- 설명 -->
		<div class="mb-3">
			<label class="form-label">설명</label>
			<textarea class="form-control" name="description" rows="4"></textarea>
		</div>

		<!-- 제조사 -->
		<div class="mb-3">
			<label class="form-label">제조사</label>
			<input type="text" class="form-control" name="manufacturer">
		</div>

		<!-- 분류 -->
		<div class="mb-3">
			<label class="form-label">분류</label>
			<input type="text" class="form-control" name="category">
		</div>

		<!-- 재고 수 -->
		<div class="mb-3">
			<label class="form-label">재고 수</label>
			<input type="number" class="form-control" name="unitsInStock" required>
		</div>

		<!-- 상태 -->
		<div class="mb-3">
			<label class="form-label">상태</label><br>
			<input type="radio" name="condition" value="NEW" required> 신규
			<input type="radio" name="condition" value="OLD"> 중고
			<input type="radio" name="condition" value="RE"> 재생
		</div>

		<!-- 등록 버튼 -->
		<div class="text-end">
			<button type="submit" class="btn btn-primary">등록</button>
			<a href="products.jsp" class="btn btn-secondary">목록</a>
		</div>
	</form>
</div>

<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp" />
</body>
</html>
