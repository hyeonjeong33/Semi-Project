<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="height=device-height, initial-scale=1.0">
<title>Hippe || 대한민국 가장 힙한 페스티벌, 히페 :: 마이페이지 :: </title>
  <link href="/Hippe/resources/css/member_mypage.css" rel="stylesheet" type="text/css" >
  <!--booststrap-->
  <link href="/Hippe/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
  <!--//booststrap end-->
  <!-- font-awesome icons -->
  <link href="/Hippe/resources/css/font-awesome.min.css" rel="stylesheet">
  <!-- //font-awesome icons -->
  <!--stylesheets-->
  <link href="/Hippe/resources/css/style.css" rel='stylesheet' type='text/css' media="all">
  <!--//stylesheets-->
  <link href="//fonts.googleapis.com/css?family=Josefin+Sans:400,600,700" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=Libre+Franklin:400,500" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/Hippe/resources/js/member.js"></script>
<script type="text/javascript">
	function withdrawCallback(msg){
		if(msg=="S"){
			location.href='/Hippe/memberController.do?command=main';
		}
	}
</script>
<body>
<%@include file="../common/hippe_header.jsp" %>
	
			<div class="div_mid">
				<input type="hidden" name="member_id" value="">
				<div class="div_box" id="mypage">
					<label class="box_label">회원정보수정</label>
					<img id="mypage_img" src="../resources/images/User.png" alt="마이페이지"/>		
					<div id="modify" class="btnDiv" onclick="location.href='../meme'">수   정</div>
				</div>
				<div class="div_box" id="reservations">
					<label class="box_label">예매 확인/취소</label>
					<div id="reservations2" class="btnDiv" onclick="location.href='/Hippe/ReservationController.do?command=ticket-check'">예매확인</div>
				</div>	
				<div class="div_box" id="bookmark">
					<label id="box_label">즐겨찾기</label>
					<div id="modify2" class="btnDiv">확   인</div>
					</div>
				<div class="div_box" id="leave">
					<label id="box_label">회원탈퇴</label>
					<div id="modify3" onclick="popupWithdraw()" class="btnDiv">회원탈퇴</div>
				</div>
			</div>

</body>
</html>
