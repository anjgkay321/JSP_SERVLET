<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="C09.DBUtils, C04.UserDto,java.util.*"%>
<%
	//파라미터
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String role = request.getParameter("role");

	

	//DBUtils dbutils = DBUtils.getInstance();
	int result =  DBUtils.getInstance().update(new UserDto(userid,password,role));
	
	if(result>0)
		out.println("<script>alert('update 성공');location.href='./selectAll.jsp'</script>");
	else
		out.println("<script>alert('update 실패');location.href='history.go(-1)'</script>");
	
%>