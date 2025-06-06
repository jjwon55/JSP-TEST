<%@page import="shop.dto.Ship"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ include file="/layout/meta.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String shippingDate = request.getParameter("shippingDate");
    String country = request.getParameter("country");
    String zipCode = request.getParameter("zipCode");
    String address = request.getParameter("addressName");
    String phone = request.getParameter("phone");
	
    // 세션에 저장
    Ship ship = Ship.builder().shipName(name)
    						  .date(shippingDate)
    						  .country(country)
    						  .zipCode(zipCode)
    						  .address(address)
    						  .phone(phone)
							  .build();	    						  
	
    session.setAttribute("ship", ship);
   
    /* response.sendRedirect("order.jsp"); */
    response.sendRedirect(root + "/shop/order.jsp");
%>

