<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="height=device-height, initial-scale=1">
<title>Hippe || 대한민국 가장 힙한 페스티벌, 히페 :: 축제정보 조회 :: </title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
  <link href="../resources/css/board_festival.css" rel="stylesheet" type="text/css" media="all">
  <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
  <link href="../resources/css/font-awesome.min.css" rel="stylesheet">
  <link href="../resources/css/style.css" rel='stylesheet' type='text/css' media="all">
  <link href="//fonts.googleapis.com/css?family=Josefin+Sans:400,600,700" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=Libre+Franklin:400,500" rel="stylesheet">
  <style type="text/css">
  .div_balloon{
 	overflow: scroll;
 	overflow-x: hidden;
 	 
  }
  #detail-content{
  position: absolute;
    top: 180%;
  }
  .img_spring{
  width: 280px;
  height: 280px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_summer{
  width: 280px;
  height: 280px;
  margin-left : 35px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_fall{
  width: 280px;
  height: 280px;
  border-radius: 25px;
  }
  .img_winter{
  width: 280px;
  height: 280px;
  margin-left : 35px;
  border-radius: 25px;
  }
  </style>
</head>
<body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/Hippe/resources/js/festival.js" type="text/javascript"></script>
<%@ include file="../common/hippe_header.jsp" %>

	<div class="div_top_title">
		<h5 class="top-title mb-lg-4 mb-3 text-center">대한민국 축제, 어디까지 가봤 니?</h5>
	    <h3 class="title mb-lg-5 mb-md-4 mb-sm-4 mb-3 text-center">전국에서 열리는 축제정보를 한번에 검색해보세요!</h3>
    </div>
	<div class="div_map">
		<img class="img_spring" id="spring" alt="봄" src="../resources/images/spring.jpg" onclick="seasonUp(this.id)">
		<img class="img_summer" id="summer" alt="여름" src="../resources/images/summer.jpg" onclick="seasonUp(this.id)"><br/>
		<img class="img_fall" id="fall" alt="가을" src="../resources/images/fall.jpg" onclick="seasonUp(this.id)">
		<img class="img_winter" id="winter" alt="겨울" src="../resources/images/winter.jpg" onclick="seasonUp(this.id)">
	</div>
	<div class="div_balloon">
	</div>
	
	<div id="detail-content" style = "display : none"></div>
	<div id="map"></div>
	<div id="directions"></div>
</body>
</html>