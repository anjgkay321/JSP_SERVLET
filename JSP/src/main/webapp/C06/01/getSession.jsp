<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>확인하기</h1>

	<div>REQUEST 속성확인</div>
	ID : <%=request.getAttribute("ID1") %>
	PW : <%=request.getAttribute("PW1") %>
	
	<div>SESSION 속성확인</div>
	ID : <%=session.getAttribute("ID2") %>
	PW : <%=session.getAttribute("PW2") %>
	
</body>
</html>