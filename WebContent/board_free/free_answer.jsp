<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="hippe.board.dto.BoardDto"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="height=device-height, initial-scale=1">
<title>야때(Yatte!) - 자유게시판(답글작성)</title>
</head>
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
</head>
<body>
<%@ include file="../common/hippe_header.jsp" %>
	
	<jsp:useBean id="dto" class="hippe.board.dto.BoardDto" scope="request"></jsp:useBean>
	<h1>답변</h1>
	
	<form action="controller.do" method="post">
		<input type="hidden" name="command" value="answer">
		<input type="hidden" name="postnum" value = "<%=dto.getBoard_postnum() %>" />
		<table border="1">
			<col width="100">
			<col width="350">
	
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${dto.title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작 성">				
					<input type="button" value="취  소" onclick="location.href='freeController.do?command=selectlist'">				
				</td>
			</tr>
		</table>
	</form>

</body>
</html>