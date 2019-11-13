<%@page import="hippe.board.dto.BoardDto"%>
<%@page import="hippe.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="height=device-height, initial-scale=1">
<title>야때(Yatte!) - 자유게시판(게시글 수정)</title>
</head>
<body>
<jsp:include page="../common/hippe_header.jsp"></jsp:include>

		<jsp:useBean id="dto" class="hippe.board.dto.BoardDto" scope="request"></jsp:useBean>
		
	<form action="controller.do" method="post">
		
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="postnum" value = "<%=dto.getBoard_postnum() %>" />
			<table border="1">
				<col width = "100">
				<col width = "350">
	
				
			<tr>
				<th>글번호</th>
				
				<td><jsp:getProperty property="postnum" name="dto" /></td>
			</tr>
			<tr>	
				<th>작성자</th>
				<td><jsp:getProperty property="writer" name="dto"/></td>
				
			</tr>
			<tr>
				<th>작성일</th>
				<td><jsp:getProperty property="regdate" name="dto"/></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="title" value=<%=dto.getBoard_title() %>></td>
			</tr>
			<tr>
				<th>내 용</th>
					<td>
						<textarea  rows="10" cols="60" name="content"><%=dto.getBoard_content() %></textarea>
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수   정">
					<input type="button" value="취   소" onclick="location.href='freeController.do?command=selectlist'">
				</td> 
			</tr>		
		</table>
	</form>
	
</body>
</html>