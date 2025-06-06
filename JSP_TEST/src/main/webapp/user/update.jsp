<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp"%>
<%@ include file="/layout/link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
</head>
<body>

	<%
	String loginId = (String) session.getAttribute("loginId");

	if (loginId == null || loginId.equals("")) {
		response.sendRedirect(root);
	}

	boolean login = false;
	if (loginId != null && !loginId.isEmpty()) {
		login = true;
	}

	UserRepository userDAO = new UserRepository();
	User loginUser = userDAO.getUserById(loginId);

	// 이메일 : 아이디@도메인 분리
	String mail = loginUser.getMail();
	String[] email = {"", ""};
	if (mail != null && mail.contains("@")) {
		email = mail.split("@");
	}
	String email1 = email[0];
	String email2 = email[1];

	// 생일 : yyyy-MM-dd 형식 분리
	String birthStr = loginUser.getBirth();
	String[] birth = {"", "", ""};
	if (birthStr != null && birthStr.contains("-")) {
		birth = birthStr.split("-");
	}
	String year = birth[0];
	String month = birth[1];
	String day = birth[2];

	String phone = loginUser.getPhone();
	phone = phone == null ? "" : phone;
	loginUser.setPhone(phone);

	String address = loginUser.getAddress();
	address = address == null ? "" : address;
	loginUser.setAddress(address);
	%>

	<jsp:include page="/layout/header.jsp" />

	<div class="row m-0 mypage">
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
				<ul class="nav nav-pills flex-column mb-auto">
					<% if (login) { %>
					<li class="nav-item"><a href="<%=root%>/user/index.jsp" class="nav-link link-body-emphasis"> 마이 페이지 </a></li>
					<li class="nav-item"><a href="<%=root%>/user/update.jsp" class="nav-link active" aria-current="page"> 회원정보 수정 </a></li>
					<% } %>
					<li><a href="<%=root%>/user/order.jsp" class="nav-link link-body-emphasis"> 주문내역 </a></li>
				</ul>
				<hr>
			</div>
		</div>

		<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
				<h1 class="display-5 fw-bold text-body-emphasis">회원 정보 수정</h1>
			</div>

			<div class="container shop m-auto mb-5">
				<form action="update_pro.jsp" name="updateForm" method="post">

					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2">아이디</label>
						<input type="text" class="form-control col-md-10" name="id" value="<%=loginUser.getId()%>" readonly>
					</div>

					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2">이름</label>
						<input type="text" class="form-control col-md-10" name="name" value="<%=loginUser.getName()%>">
					</div>

					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2">성별</label>
						<div class="col-md-10 d-flex align-items-center">
							<input type="hidden" name="temp-gender" value="<%=loginUser.getGender()%>" id="temp-gender" />
							<div class="radio-box d-flex">
								<div class="radio-item mx-5">
									<input type="radio" class="form-check-input" name="gender" value="여" id="gender-female">
									<label for="gender-female">여자</label>
								</div>
								<div class="radio-item mx-5">
									<input type="radio" class="form-check-input" name="gender" value="남" id="gender-male">
									<label for="gender-male">남자</label>
								</div>
							</div>
						</div>
					</div>

					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2">생일</label>
						<div class="col-md-10 d-flex align-items-center">
							<div class="row">
								<div class="col">
									<input type="text" class="form-control" name="year" value="<%=year%>" placeholder="출생년도">
								</div>
								<div class="col">
									<input type="hidden" name="tempMonth" value="<%=month%>" id="temp-month">
									<select name="month" class="h-100 form-select">
										<% for(int i=1; i<=12; i++) { String m = (i<10?"0":"")+i; %>
										<option value="<%=m%>"><%=m%>월</option>
										<% } %>
									</select>
								</div>
								<div class="col">
									<input type="text" class="form-control" name="day" value="<%=day%>" placeholder="일자">
								</div>
							</div>
						</div>
					</div>

					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2">이메일</label>
						<div class="row col-md-10 align-items-center">
							<div class="col-4 px-0">
								<input type="text" class="form-control" name="email1" value="<%=email1%>">
							</div>
							<div class="col-auto">@</div>
							<div class="col-4 px-0">
								<input type="hidden" name="tempEmail2" value="<%=email2%>" id="temp-email2">
								<select name="email2" class="form-select">
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="kakao.com">kakao.com</option>
								</select>
							</div>
						</div>
					</div>

					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2">전화번호</label>
						<input type="text" class="form-control col-md-10" name="phone" value="<%=phone%>">
					</div>

					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2">주소</label>
						<input type="text" class="form-control col-md-10" name="address" value="<%=address%>">
					</div>

					<div class="d-flex justify-content-between mt-5 mb-5">
						<a href="javascript: ;" onclick="alertDel()" class="btn btn-lg btn-danger">탈퇴</a>
						<input type="submit" class="btn btn-lg btn-primary" value="수정" />
					</div>

				</form>
			</div>

			<jsp:include page="/layout/footer.jsp" />
		</div>
	</div>

	<jsp:include page="/layout/script.jsp" />

	<script>
		let form = document.updateForm;

		let tempGender = document.getElementById('temp-gender');
		document.getElementById('gender-female').checked = tempGender.value == '여';
		document.getElementById('gender-male').checked = tempGender.value == '남';

		let tempMonth = document.getElementById('temp-month');
		form.month.value = tempMonth.value;

		let tempEmail2 = document.getElementById('temp-email2');
		form.email2.value = tempEmail2.value;

		function alertDel() {
			if (confirm('정말 탈퇴하시겠습니까?')) {
				form.action = 'delete.jsp';
				form.submit();
			}
		}
	</script>
</body>
</html>
