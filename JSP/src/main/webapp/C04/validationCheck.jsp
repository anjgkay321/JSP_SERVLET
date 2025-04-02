<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./errors.jsp"%>
<%@page import="C04.*"%>
<%

	//request로부터 전달받은 파라미터 꺼내서 System.out 확인
	//받은 username,password 값이 null인지여부를 체크(String API trim()  + isEmpty() 이용)
	//에러발생시 처리되는 페이지로 전달(error.jsp)
	//에러 미발생시 dbUtils.jsp로 해당내용 Forwarding

	String url = (String)request.getAttribute("url");
	String serviceNo = (String)request.getAttribute("serviceNo");
	if(url.contains("/join")){
		
		//join
		UserDto userDto = (UserDto)request.getAttribute("userDto");
		isValid(userDto);
	}else if(url.contains("/myinfo")){
		//myinfo
		String userid = request.getParameter("userid");
		isValid(userid);
	}
		
	//myinfo
	//에러 미발생시 dbUtils.jsp 로 해당내용 Forwarding
	request.setAttribute("url", "/join");  // DB 요청 처리
	request.setAttribute("serviceNo",1);  //ServiceNo C : 1 R : 2 U : 3 D : 4
	request.getRequestDispatcher("./dbUtils.jsp").forward(request, response);
%>

<%!

	void isValid(UserDto userDto) throws Exception{
		System.out.println("[VALIDATION CHECK]" + userDto);
		if(userDto == null)
			throw new Exception("userDto가 NULL입니다..")
			;
		if(userDto.getUserid().trim().isEmpty())
			throw new Exception("userid를 입력하세요")
			;
		if(userDto.getPassword().trim().isEmpty())
			throw new Exception("Password를 입력하세요")
			;
		if(userDto.getRole().trim().isEmpty())
			throw new Exception("기본 역활(ROLE_USER)이 지정되지 않았습니다..")
			;
	
}
	void isValid(String userid)throws Exception{
		if(userid.trim().isEmpty())
			throw new Exception("userid를 입력하세요");
	}
%>