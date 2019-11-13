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
  .img_1{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_2{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_3{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_4{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_5{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_6{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_7{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_8{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_9{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_10{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_11{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
  border-radius: 25px;
  }
  .img_12{
  width: 150px;
  height: 150px;
  margin-bottom : 40px;
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
		<img class="img_1" id="January" alt="1월" src="../resources/images/1월.PNG" onclick="monthUp(this.id)">
		<img class="img_2" id="February" alt="2월" src="../resources/images/2월.PNG" onclick="monthUp(this.id)">
		<img class="img_3" id="March" alt="3월" src="../resources/images/3월.PNG" onclick="monthUp(this.id)">
		<img class="img_4" id="April" alt="4월" src="../resources/images/4월.PNG" onclick="monthUp(this.id)"><br/>
		<img class="img_5" id="May" alt="5월" src="../resources/images/5월.PNG" onclick="monthUp(this.id)">
		<img class="img_6" id="June" alt="6월" src="../resources/images/6월.PNG" onclick="monthUp(this.id)">
		<img class="img_7" id="July" alt="7월" src="../resources/images/7월.png" onclick="monthUp(this.id)">
		<img class="img_8" id="August" alt="8월" src="../resources/images/8월.png" onclick="monthUp(this.id)"><br/>
		<img class="img_9" id="September" alt="9월" src="../resources/images/9월.png" onclick="monthUp(this.id)">
		<img class="img_10" id="October" alt="10월" src="../resources/images/10월.png" onclick="monthUp(this.id)">
		<img class="img_11" id="November" alt="11월" src="../resources/images/11월.png" onclick="monthUp(this.id)">
		<img class="img_12" id="December" alt="12월" src="../resources/images/12월.png" onclick="monthUp(this.id)">
	</div>
	<div class="div_balloon">
	</div>
	
	<div id="detail-content" style = "display : none"></div>
	<div id="map"></div>
	<div id="directions"></div>
</body>
</html>