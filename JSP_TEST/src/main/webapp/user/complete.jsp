<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp" %>
<%
    String type = request.getParameter("type");
    String message = "";

    String loginId = (String) session.getAttribute("loginId");

    if ("delete".equals(type)) {
        message = "회원 정보가 삭제되었습니다.";
    } else if ("update".equals(type)) {
        message = "회원 정보가 수정되었습니다.";
    } else if ("login".equals(type) && loginId != null) {
        message = loginId + "님, 환영합니다!";
    } else {
        message = "회원가입이 완료되었습니다.";
    }
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
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보</h1>
	</div>

<!-- 회원 가입/수정/탈퇴 완료 -->
	<div class="container mb-5">
		<h1 class="text-center"><%= message %></h1>
		<div class="btn-box d-flex justify-content-center p-5">
			<a href="<%= root %>/index.jsp" class="btn btn-lg btn-primary">메인 화면</a>
		</div>
	</div>

<jsp:include page="/layout/footer.jsp" />

<script src="<%= root %>/static/js/validation.js"></script>
</body>
</html>
