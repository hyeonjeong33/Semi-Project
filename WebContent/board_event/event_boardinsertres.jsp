<%@page import="hippe.board.dto.BoardDto"%>
<%@page import="hippe.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		BoardDao dao = new BoardDao();
		BoardDto dto = new BoardDto();
		dto.setWriter(name);
		dto.setBoard_title(subject);
		dto.setBoard_content(content);
		
		int res = dao.insert(dto);
		
		if (res > 0) {
%>
	<script type="text/javascript">
		alert("글 작성 완료!");
		location.href = "./board_event/event_boardlist.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("글 작성 실패ㅠㅠ");
		location.href = "./board_event/event_boardinsert.jsp";
	</script>
	<%
		}
	%>

</body>
</html>