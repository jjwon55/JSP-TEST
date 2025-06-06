<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 자동 로그인, 토큰 쿠키 삭제
	
	// 세션 무효화?
	session.invalidate();
	
	// 자동 로그인 쿠키 제거
	Cookie autoCookie = new Cookie("autoLoginToken", "");
	autoCookie.setMaxAge(0);
	autoCookie.setPath("/");
	response.addCookie(autoCookie);
	
	// DB에서도 토큰 제거
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie c : cookies) {
			if (c.getName().equals("autoLoginToken")) {
				String token = c.getValue();
				UserRepository repo = new UserRepository();
				repo.deleteToken(token);
			}
		}
	}
	response.sendRedirect("login.jsp");

%>
