<%@page import="hippe.board.dto.BoardDto"%>
<%@page import="hippe.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/hippe_header.jsp"></jsp:include>
	
	<form action ="../eventController.do" method="post">
		<input type="hidden" name="command" value="insert">
		<div class="subject">
			<span>이벤트 작성하기</span>
		</div>
					
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>제   목</th>
				<td><input type="text" name="board_title"></td>
			</tr>
			<tr>
				<th>내   용</th>
				<td><textarea rows="10" cols="60" name="board_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="작성">
				<input type="button" value="취소" onclick="location.href='../eventController.do?command=eventlist'"></td>
			</tr>
		</table>
	</form>
</body>
</html>