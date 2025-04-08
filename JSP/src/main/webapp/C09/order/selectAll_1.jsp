<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	품목별 총합(총합별 내림차순)
	select category,sum(price * quantity) from tbl_order
	group by category
	having sum(price*quantity)>=50000
	order by sum(price*quantity)desc;
	
	날짜별 구매 총평균
	select order_date,round(avg(price*quantity),2)
	from tbl_order
	group by order_date;
 -->    
 <%@page import="C09.*, C04.UserDto,java.util.*,java.time.format.DateTimeFormatter"%>
 <% 
 	List<OrderDto> list = DBUtils.getInstance().selectAllOrder();
 	List<priceDto> list2 = DBUtils.getInstance().selectAllprice();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>품목별 총액(50000원 이상)</h1>
	<% 
	
	%>
	<table border="1">
		<tr>
			<th>품목</th>
			<th>총합</th>
		</tr>
		<%
			for(OrderDto orderDto : list){
		%>
		<tr>
			<th><%=orderDto.getCategory() %></th>
			<th><%=orderDto.getSum() %></th>
		</tr>
		<%
		}
		%>
	</table>
	
	<h1>날짜별 구매 총평균</h1>
	<!-- 
	select order_date,round(avg(price*quantity),2)
	from tbl_order
	group by order_date;
	 -->
	 	<table border="1">
		<tr>
			<th>품목</th>
			<th>총합</th>
		</tr>
		<%
			for(priceDto priceDto : list2){
				//yyyy.MM.dd
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
		%>
		<tr>
			<th><%=priceDto.getOrder_date().format(formatter)%></th>
			<th><%=priceDto.getRound()%></th>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>