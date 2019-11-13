<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#center{
		margin-left: 40%;
	}
	#labelWelcome{
		margin-left: -5%;
		font-size: 30px; width: 500px; height: 40px; color: rgb(0, 0, 0);
	}
	#loginBtn{
	position: relative;
	top : 10em;
	width: 300px; 
	height: 60px; 
	font-size : 16px;
	background-color: rgb(240, 123, 125);
	color: rgb(255, 255, 255);
	cursor: pointer;
	border-radius: 0.5em 0.5em 0.5em 0.5em;
	line-height: 4em;	
	text-align: center;
	}
	
</style>
</head>
<body>

<jsp:include page="../common/hippe_header.jsp"></jsp:include>
	
	<div id="center">
		<br/><br/><br/><br/><br/><br/><br/><br/>
		<div id="labelWelcome">히페의 회원이 되셨습니다!</div>
		<div id="loginBtn" onclick="location.href='../loginController.do?command=loginBtn'">로그인하기</div>
	</div>

</body>
</html>