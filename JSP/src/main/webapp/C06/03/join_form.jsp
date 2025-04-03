<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

        <h1>회원가입</h1>
	
	<form action="${pageContext.request.contextPath}/C06/03/join.jsp" method="post">
		<div>
			<label>아이디 : </label><span>${userid_msg}</span><br><input type="text" name="id" />
		</div>
		
		<div>
			<label>패스워드 : </label><span>${password_msg}</span><br><input type="text" name="password"/>
		</div>
	<button>회원가입</button>
	</form>
	
</body>
</html>