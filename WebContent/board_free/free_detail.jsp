<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>야때(Yatte!) - 자유게시판</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
<!--booststrap-->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
<!--//booststrap end-->
<!-- font-awesome icons -->
<link href="../resources/css/font-awesome.min.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!--stylesheets-->
<link href="../resources/css/style.css" rel='stylesheet' type='text/css' media="all">
<!--//stylesheets-->
<link href="//fonts.googleapis.com/css?family=Josefin+Sans:400,600,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Libre+Franklin:400,500" rel="stylesheet">
  <link href="../resources/css/board_detail.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../common/hippe_header.jsp"></jsp:include>
		<jsp:useBean id="dto" class="hippe.board.dto.BoardDto" scope="request"></jsp:useBean>
		
	<div class="div_top_title">
		<h5 class="top-title mb-lg-4 mb-3 text-center">BOARD</h5>
		<h3 class="title mb-lg-5 mb-md-4 mb-sm-4 mb-3 text-center">자유게시판</h3>
	</div>
		<div class="content">
		<input type="hidden" name="command" value="delete">
		<div class="table">
		<table class="table_board">
			<tr>
				<td id="board_title" colspan="2"><jsp:getProperty property="board_title" name="dto"/></td>
			</tr>
			<tr>
			<td id ="writer"><jsp:getProperty property="writer" name="dto"/></td>
			<td id="regdate"><jsp:getProperty property="board_regdate" name="dto"/></td>
			</tr>	
			<tr>
				<td colspan="2"><div id="board_content"><jsp:getProperty property="board_content" name="dto"/></div></td>
			</tr>
		</table>
			<div id ="btn">
				<input type="button" value="글 목록" onclick="location.href='freeController.do?command=list'" >
				<c:choose>
				<c:when test="${id eq dto.writer}">
				<input type="button" value="수  정" onclick="location.href='freeController.do?command=updateform&postnum=<jsp:getProperty property="board_postnum" name="dto"/>'"/>
				<input type="button" value="삭  제" onclick="location.href='freeController.do?command=delete&postnum=<jsp:getProperty property="board_postnum" name="dto"/>'"/>
				</c:when>
				</c:choose>
				<input type="button" value="답  변" onclick="location.href='freeController.do?command=answerform&postnum=<jsp:getProperty property="board_postnum" name="dto"/>'"/>		
			</div>
		</div>
	</div>	
</body>
</html>