<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.OrderRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp"%>
<%@ include file="/layout/link.jsp"%>
<%

// 1. 파라미터 받기
String phone = request.getParameter("phone");
String orderPw = request.getParameter("orderPw");

// 2. DAO 생성
OrderRepository orderRepo = new OrderRepository();

// 3. 주문 목록 조회 (비회원용)
List<Product> orderList = orderRepo.list(phone, orderPw);

if (orderList != null && !orderList.isEmpty()) {
    // 4. 세션에 주문정보 저장
    session.setAttribute("orderList", orderList);
    session.setAttribute("orderCount", orderList.size());
    session.setAttribute("orderPhone", phone);
    session.removeAttribute("orderError");
} else {
    // 주문 정보가 없거나 틀린 경우
    session.setAttribute("orderList", null);
    session.setAttribute("orderCount", 0);
    session.setAttribute("orderPhone", null);
    session.setAttribute("orderError", "입력한 정보와 일치하는 주문 내역이 없습니다.");
}

// 5. 결과 페이지로 리디렉션
response.sendRedirect(root + "/user/order.jsp");
	
	
	
%>