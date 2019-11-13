<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hippe :: 회원탈퇴</title>
<style>
	div.btnWithDraw{
	cursor: pointer;
	font-size: 15px;
	text-align: center;
    width: 7em;
    height: 3.5em;
    border-radius: 5px;
    padding: 0px;
    line-height: 3.5em;
    position: absolute;
    background-color: rgb(89, 202, 183); 
    color: #fff;
    left: 32%;
    top: 65%; 		}
    div.btnWithDraw:hover{
    background-color: rgb(240,123,125);
    }
	input[type=password]{
	width: 250px;
    height: 45px;
    padding: 12px 20px;
    margin: 10px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size:20px;
    position: absolute;
    top: 38%;
    left: 14px;}
   	#top_label{
   	font-size: 21px;
    font-family: sans-serif;
    font-weight: lighter;
    position: absolute;
    top: 5%;
    left: 29.5%; }
    #mid_label{
    font-family: sans-serif;
    font-weight: lighter;
    position: absolute;
    top: 20%;
    left: 14%; }
</style>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
<script src="/Hippe/resources/js/member.js" type="text/javascript"></script>
<script type="text/javascript">
</script>
<body>
	<div>
		<h4 id="top_label">비밀번호 입력</h4>
		<h5 id="mid_label">회원탈퇴를 위해 비밀번호를 확인합니다.</h5>
		<input type="hidden" name="member_id" value="${id}">
		<input type="password" name="input_pw" required/>
		<div class="btnWithDraw" onclick="withdrawMy()">탈퇴하기</div>
		<form></form>
	</div>
</body>
</html>