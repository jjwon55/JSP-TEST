<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="user" class="shop.dto.User" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="gender" />
<jsp:setProperty name="user" property="phone" />
<jsp:setProperty name="user" property="address" />

<%
	// 1. 날짜 조합
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String birth = year + "-" + month + "-" + day;
	user.setBirth(birth);

	// 2. 이메일 조합
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String mail = email1 + "@" + email2;
	user.setMail(mail);

	// 3. DB 업데이트 처리
	UserRepository userDAO = new UserRepository();
	int result = userDAO.update(user);

	if (result > 0) {
		response.sendRedirect("complete.jsp?type=update");
	} else {
		response.sendRedirect("update.jsp?error=fail");
	}
%>
