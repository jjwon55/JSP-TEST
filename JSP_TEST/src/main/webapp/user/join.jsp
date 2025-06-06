<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
<jsp:include page="/layout/header.jsp" />

<div class="px-4 py-5 mt-5 text-center">
	<h1 class="display-5 fw-bold text-body-emphasis">회원 가입</h1>
</div>

<div class="container shop p-5 mb-5">
	<form action="join_pro.jsp" name="joinForm" onsubmit="return checkJoin()" method="post">
		
		<!-- 아이디 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-4">아이디</label>
			<input type="text" class="form-control col-md-8" name="id" required>
		</div>

		<!-- 비밀번호 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-4">비밀번호</label>
			<input type="password" class="form-control col-md-8" name="password" required>
		</div>

		<!-- 비밀번호 확인 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-4">비밀번호 확인</label>
			<input type="password" class="form-control col-md-8" name="pw_confirm" required>
		</div>

		<!-- 이름 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-4">이름</label>
			<input type="text" class="form-control col-md-8" name="name" required>
		</div>

		<!-- 성별 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-4">성별</label>
			<div class="col-md-8 d-flex align-items-center">
				<div class="form-check mx-2">
					<input type="radio" class="form-check-input" name="gender" value="여" id="female">
					<label for="female">여자</label>
				</div>
				<div class="form-check mx-2">
					<input type="radio" class="form-check-input" name="gender" value="남" id="male">
					<label for="male">남자</label>
				</div>
			</div>
		</div>

		<!-- 생일 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-4">생일</label>
			<div class="col-md-8 d-flex">
				<input type="text" class="form-control me-2" name="birthYear" placeholder="출생년도">
				<select name="birthMonth" class="form-select me-2">
					<% for(int i=1; i<=12; i++) { String m = (i<10?"0":"")+i; %>
						<option value="<%=m%>"><%=m%>월</option>
					<% } %>
				</select>
				<input type="text" class="form-control" name="birthDay" placeholder="일자">
			</div>
		</div>

		<!-- 이메일 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-4">이메일</label>
			<div class="col-md-8 d-flex">
				<input type="text" class="form-control me-2" name="emailId" placeholder="이메일">
				<div class="col-auto">@</div>
				<select name="emailDomain" class="form-select ms-2">
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="kakao.com">kakao.com</option>
				</select>
			</div>
		</div>

		<!-- 전화번호 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-4">전화번호</label>
			<input type="text" class="form-control col-md-8" name="phone">
		</div>

		<!-- 주소 -->
		<div class="input-group mb-3 row">
			<label class="input-group-text col-md-4">주소</label>
			<input type="text" class="form-control col-md-8" name="address">
		</div>

		<!-- 버튼 -->
		<div class="d-flex justify-content-between mt-5 mb-5">
			<a href="javascript:history.back()" class="btn btn-lg btn-secondary">취소</a>
			<input type="submit" class="btn btn-lg btn-primary" value="가입">
		</div>
	</form>
</div>

<jsp:include page="/layout/footer.jsp" />
<script src="<%=root %>/static/js/validation.js"></script>
</body>
</html>
