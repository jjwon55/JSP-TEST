<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 1. 세션 무효화
    session.invalidate();  // 현재 사용자 세션 정보를 모두 삭제

    // 2. 자동 로그인 쿠키 제거 (브라우저 쿠키에서 제거)
    Cookie autoCookie = new Cookie("autoLoginToken", "");
    autoCookie.setMaxAge(0); // 쿠키를 즉시 만료시키기
    autoCookie.setPath("/"); // 경로 설정 (사이트 전체에 적용)
    response.addCookie(autoCookie); // 브라우저에 전달하여 삭제

    // 3. DB에서 자동 로그인 토큰 제거
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("autoLoginToken".equals(c.getName())) {
                String token = c.getValue();
                if (token != null && !token.isEmpty()) {
                    UserRepository repo = new UserRepository();
                    repo.deleteToken(token); // DB에서 토큰 제거
                }
                break;
            }
        }
    }

    // 4. 로그아웃 후 로그인 페이지로 이동
    response.sendRedirect("login.jsp");
%>