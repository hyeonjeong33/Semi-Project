<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hippe || 대한민국 가장 힙한 페스티벌, 히페 :: 아이디/비밀번호 찾기 ::</title>
</head>
<style>
div.box{
	border: 1px solid gray;
	border-radius: 5px;
	display: inline-block;
	width : 300px;
	height : 300px;
}
div.btnSubmit{
	border-radius: 5px;
	background: #59CAB7;
	color: #fff;
	width: 170px;
	height: 50px;
	line-height: 50px;
	font-size : 16px;
	text-align: center;
	cursor: pointer;
}
div.btnSubmit:hover{
	background: rgb(240,123,125);
}
</style>
<link href="/Hippe/resources/css/member_login.css" rel="stylesheet" type="text/css">
<link href="/Hippe/resources/css/style.css" rel='stylesheet' type='text/css' media="all">
<link href="/Hippe/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
<link href="/Hippe/resources/css/font-awesome.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript" ></script>
<script src="/Hippe/resources/js/member.js" type="text/javascript"></script>
<body>
	<%@include file="../common/hippe_header.jsp" %>
	
	<br><br><br><br><br><br><br>
	<h3>아이디 비밀번호 찾기</h3>
	<!-- 아이디찾기 -->
	<div id="find-id" class="box">
		<h4>아이디 찾기</h4>
		<form action="../memberController.do" method="post">
			<input type="hidden" name="command" value="find-id">
			<table>
				<tr><td>이  름</td></tr>
				<tr><td><input type="text" name="myName" required="required"></td></tr>
				<tr><td>이메일</td></tr>
				<tr><td><input type="email" name="myEmail-id" required="required"></td></tr>
			</table>
			<div id="btn_findId" class="btnSubmit"onclick="findMyId()">아이디 찾기</div>
		</form>
	</div>
	<!-- 비밀번호 찾기 -->
	<div id="find-pw" class="box">
		<h4>비밀번호 찾기</h4>
		<form action="../memberController.do" method="post">
			<input type="hidden" name="command" value="find-pw">
			<table>
				<tr><td>아이디</td></tr>
				<tr><td><input type="text" name="myId" required="required"></td></tr>
				<tr><td>이메일</td></tr>
				<tr><td><input type="email" name="myEmail-pw" required="required"></td></tr>
			</table>
			<div id="btn_findPw" class="btnSubmit" onclick="findMyPw()">비밀번호 찾기</div>
		</form>
	</div>
</body>
</html>