<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./errors.jsp"%>

<!-- 속성/기능추가 -->
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
		pstmt.setString(1,userDto.getUserid());
		pstmt.setString(2,userDto.getPassword());
		pstmt.setString(3,userDto.getRole());

		int result = pstmt.executeUpdate();
		conn.commit();

		pstmt.close();

		return result;

	}%>

<!-- Service 함수 -->
<%
String url = (String) request.getAttribute("url");
Integer serviceNo = (Integer) request.getAttribute("serviceNo");
System.out.println("URL : " + url);
System.out.println("SERVICENO : " + serviceNo);
getConnection();
if (url.contains("/join")) {
	UserDto userDto = (UserDto) request.getAttribute("userDto");
	if(insert(userDto)>0){
		response.sendRedirect("login_form.jsp");
		return;
	}
}
%>