<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  
		UserDto객체에 전달받은 파라미터(username,password)를 저장
		request에  setAttribute로 userDto 저장("userDto",userDto);
		02ValidationCheck.jsp 로 forwarding
-->
<%@ page import="C04.UserDto" %>
<% 
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	UserDto userDto = new UserDto(userid,password,"ROLE_USER");
	//userDto 객체생성
	//request 내장객체 userDto 추가
	
	request.setAttribute("userDto", userDto);
	//forwarding
	request.getRequestDispatcher("./validationCheck.jsp").forward(request, response);
	


%>