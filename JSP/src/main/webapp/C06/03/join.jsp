<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*,C04.*"%>
	<%!//속성/기능 추가기능
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "system";
	private String pw = "1234";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private void getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		if (conn == null) {
			conn = DriverManager.getConnection(url, id, pw);
		}
	}

	private int insert(UserDto userDto) throws Exception {

		pstmt = conn.prepareStatement("insert into TBL_USER values(?,?,?) ");
		pstmt.setString(1, userDto.getUserid());
		pstmt.setString(2, userDto.getPassword());
		pstmt.setString(3, userDto.getRole());

		int result = pstmt.executeUpdate();
		conn.commit();

		pstmt.close();

		return result;

	}%>
	<%
	//파라미터 생성
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	//파라미터 유효성 체크
	if (id.isEmpty()) {
		request.setAttribute("userid_msg", "username을 입력하세요");
	}
	if (password.isEmpty()) {
		request.setAttribute("password_msg", "password를 입력하세요");
	}
	if (id.isEmpty() || password.isEmpty()) {
		request.getRequestDispatcher("./join_form.jsp").forward(request, response);
	}
	//db연결
	getConnection();
	%>
</body>
</html>