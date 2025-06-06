<%@ page import="shop.dto.User" %>
<%@ page import="shop.dao.UserRepository" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	// 생일 구성
	String birth = request.getParameter("birthYear") + "-" +
	               request.getParameter("birthMonth") + "-" +
	               request.getParameter("birthDay");
	
	// 이메일 구성
	String mail = request.getParameter("emailId") + "@" +
	              request.getParameter("emailDomain");
	
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	// User 객체 생성 및 저장
	User user = new User();
	user.setId(id);
	user.setPassword(password);
	user.setName(name);
	user.setGender(gender);
	user.setBirth(birth);
	user.setMail(mail);
	user.setPhone(phone);
	user.setAddress(address);
	
	// DB 등록
	UserRepository repo = new UserRepository();
	int result = repo.insert(user);
	
	// 결과 처리
	String root = request.getContextPath();
		if (result > 0) {
			response.sendRedirect(root + "/user/complete.jsp");
		} else {
			response.sendRedirect(root + "/user/join.jsp?error=invalid");
		}	
%>
