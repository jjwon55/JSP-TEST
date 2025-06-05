<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String root = request.getContextPath();
    String path = request.getPathInfo();

    if ("/logout".equals(path)) {
        System.out.println("로그아웃...");

        // 자동 로그인 토큰 쿠키 삭제
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("autoLoginToken".equals(c.getName())) {
                    c.setMaxAge(0); // 삭제
                    c.setPath("/"); // 경로 설정 중요
                    response.addCookie(c);
                }
            }
        }

        // 세션 무효화
        session.invalidate();

        // 홈으로 리다이렉트
        response.sendRedirect(root + "/index");
    }
%>
