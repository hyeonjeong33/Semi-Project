<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<style>
.box{position: fixed;
   width: 250px;
   height: 250px;
   cursor : pointer;
   text-align: right;   
   background: #59CAB7;
   }
.box:hover{ background-color:#000; opacity:20%; }
.ask-custom{
   top: 23.5%; left : 28%;
   font-size: 42px; 
   font-weight: bolder; }
.regional{
   top: 23.5%; left : 49.5%; color: #fff;
   text-align: center; 
}
.monthly{
   top:60%; left: 28%; color: #fff;
   text-align: center;
}
.seasonal{
   top:60%; left: 49.5%; color: #fff;
   text-align: center;
}
   
</style>
<body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/Hippe/resources/js/festival.js" type="text/javascript"></script>
<%@ include file="../common/hippe_header.jsp" %>
   
   <div class="box ask-custom" style="background: #fff;">어떤<br>테마의<br>축제를<br>찾으시나요?</div>
   <div class="box regional" onclick="regional()"><h1>지 역</h1><h3>City</h3></div>
   <div class="box seasonal" onclick="seasonal()"><h1>계 절</h1><h3>Season</h3></div>
   <div class="box monthly" onclick="monthly()"><h1>월</h1><h3>Month</h3></div>

</body>
<script type="text/javascript">
function regional(){
   location.href="/Hippe/festivalController.do?command=regional";
}
function seasonal(){
   location.href="/Hippe/festivalController.do?command=seasonal";
}
function monthly(){
   location.href="/Hippe/festivalController.do?command=monthly";
}

</script>
</html>