<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="C09.DBUtils, C04.UserDto,java.util.*"%>

<%
	String userid = request.getParameter("userid");

	int result = DBUtils.getInstance().deleteUser(userid);
	
	response.sendRedirect("./selectAll.jsp");
%>