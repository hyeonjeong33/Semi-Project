<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="hippe.member.dao.MemberDao" %>
<%@page import="hippe.member.dto.MemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	#btnRes{
	width: 150px;
	height: 50px;
	font-size: 17px;
	color: rgb(255, 255, 255);
	text-align : center;
	line-height: 3.3em;
	border-radius: 4px;
	background-color: rgb(240, 125, 123);
	cursor: pointer;
	position: absolute;
    left: 25%;
    top: 55%;
	}
	#msgChk{text-align: center; font-weight: inherit; margin-top: 35px;}
</style>
<body>
<br>

	<input type="hidden" name="idChk" id="idChk" value="0">
	<label id="input_id"></label>
	<label id="msg"></label>
	<div id="btnRes" onclick="window.close()">확  인</div>
</body>
</html>