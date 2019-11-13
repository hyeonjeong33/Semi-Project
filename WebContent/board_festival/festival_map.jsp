<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");	%>
<%	response.setContentType("text/html; charset=UTF-8");	%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Hippe || 대한민국 가장 힙한 페스티벌, 히페 :: 길 찾기 ::</title>
<link href="/Hippe/resources/css/festival_map.css" rel="stylesheet" type="text/css">
</head>
<body>
  	<div class="floating-panel">
  		<input type="text" id="panel-input" name="placeName">
  		<div id="btnSearch">검색</div>
  	</div>
    <div id="map"></div>
    <!-- <div class="floating-direction"></div> -->
   	<div class="floating-home" onclick="location.href='/Hippe/memberController.do?command=main'"></div>
    <script src="/Hippe/resources/js/googleMap.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_cXlKb2F8jHoGVBXDekF92FFrzh78c18&libraries=places&callback=initMap&?v=3.exp&sensor=true" type="text/javascript"></script>
</body>
</html>