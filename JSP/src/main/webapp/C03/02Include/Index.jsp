<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
:root{}
*{box-sizing:border-box;padding:10px;border:1px solid;}
a{}
ul{}
body{padding : 0; margin:0;}
.wrapper{}
.wrapper>header{min-height : 100px;}
.wrapper>header>.top-header{min-heigth:25px;}
.wrapper>header>.nav{min-height:75px;}
.wrapper>main{min-height :1000px;}
.wrapper>main>section{height : 100%;}
.wrapper>footer{min-height:250px;}

</style>

</head>
<body>
	<div class="wrapper">
		<header>
			<!--  -->
			<%@ include file="./layouts/TopHeader.jsp"%>
			<!--  -->
			<%@ include file="./layouts/Nav.jsp"%>
		</header>
		<main>
			<section>MAIN>SECTION</section>
		</main>
		<%@ include file="./layouts/Footer.jsp"%>
	</div>
</body>
</html>