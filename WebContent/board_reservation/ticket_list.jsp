<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="height=device-height, initial-scale=1">
<title>Hippe || 대한민국 가장 힙한 페스티벌, 히페 :: 티켓 예매 ::</title>
<link href="/Hippe/resources/css/board_ticket_style.css" rel="stylesheet" type="text/css">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
<link href="../resources/css/font-awesome.min.css" rel="stylesheet">
<link href="../resources/css/style.css" rel='stylesheet' type='text/css' media="all">
<link href="//fonts.googleapis.com/css?family=Josefin+Sans:400,600,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Libre+Franklin:400,500" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
	function showTicketDetail(val){
		var festival_num = $(val).siblings('#postnum').val();
		location.href = '/Hippe/festivalController.do?command=ticketdetail&festival_num=' + festival_num;
	}
</script>
</head>
<body>
<!-- header파일 포함 -->
<jsp:include page="../common/hippe_header.jsp"></jsp:include>
<section>
	<div class="div_ticketbox">
		<c:choose>
			<c:when test="${empty list}">
				판매중인 티켓이 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<div class="reco_img">
        				<div>
							<a href="#" onclick="showTicketDetail(this)">
                				<figure class="img_border"><img src="${dto.festival_imgsrc}" style="width:auto; height:auto; vertical-align: middle " alt="Seoul">
               					<i class="fas fa-plus"></i>
               					</figure>
	                			<div class="explan">
	                				<h2>${dto.festival_name}</h2>
	                				<p style=" overflow: hidden; white-space: nowrap; text-overflow: ellipsis;" >${dto.festival_content}</p>
	                				<p class="more_btn">예매하기</p>
	                			</div>
                			</a>
        					<input type="hidden" id="postnum" name="ticket-num" value="${dto.festival_num}">
          				</div>
        			</div>
				</c:forEach>				
			</c:otherwise>
		</c:choose>
	</div>
</section>	
<!-- footer영역 -->
	<jsp:include page="../common/hippe_footer.jsp"></jsp:include>
</body>
</html>