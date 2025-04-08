<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	품목별 총합(총합별 내림차순)
	select category,sum(price * quantity) from tbl_order
	group by category
	having sum(price*quantity)>=50000
	order by sum(price*quantity)desc;
 -->    
 <%@page import="C09.*, C04.UserDto,java.util.*,java.time.format.DateTimeFormatter"%>
 <% 
 	List<addrDto> list = DBUtils.getInstance().selectAlladdr();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>지역 + 날짜별 구매총액</h1>
	<table>
		<tr>
			<th>지역</th>
			<th>날짜</th>
			<th>총액</th>
		</tr>
		<%
			for(addrDto addrDto : list){
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy*MM*dd");
		%>
			<tr>
			<th><%=addrDto.getAddr() %></th>
			<th><%=addrDto.getOrder_date().format(formatter) %></th>
			<th><%=addrDto.getSum() %></th>
		</tr>
		<%} %>
	</table>
</body>
</html>