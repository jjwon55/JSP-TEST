<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="shop.dao.UserRepository" />
<%@ include file="/layout/meta.jsp" %>
<%
    // 1. 세션에서 로그인한 사용자 가져오기
    User loginUser = (User) session.getAttribute("loginUser");
    String id = loginUser.getId();

    // 2. 회원 삭제 처리
    UserRepository userDAORepository = new UserRepository();
    int result = userDAO.delete(id);

    // 3. 처리 결과에 따라 분기
   if (result > 0) {
		response.sendRedirect("complete.jsp?type=delete");
	} else {
		response.sendRedirect("update.jsp?error=fail");
	}
%>

