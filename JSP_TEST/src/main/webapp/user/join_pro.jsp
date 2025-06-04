<!-- 
	회원 가입 처리
 -->
<%@page import="java.util.Random"%>
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String mail = request.getParameter("mail");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	// 요청 정보를 객체로 매핑
	User user = new User();
    user.setId(id);
    user.setPassword(password);
    user.setName(name);
    user.setGender(gender);
    user.setBirth(birth);
    user.setMail(mail);
    user.setPhone(phone);
    user.setAddress(address);
    
    UserRepository repo = new UserRepository();
    int result = repo.insert(user);
	
    String root = request.getContextPath();
    if ( result > 0) {
        response.sendRedirect(root + "/user/complete.jsp");
    } else {
        response.sendRedirect(root + "/user/join.jsp?error=invalid");
    }

	
%>
    
    

    
    
    
    
    
    