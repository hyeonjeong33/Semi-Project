<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
<script src="lang/summernote-ko-KR.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style type="text/css">
body{
	display: flow-root;
}
.submit {
	width: 150px;
	height: 45px;
	background-color: rgb(89, 202, 183);
	line-height: 3em;
	text-align: center;
	border-radius: 4px;
	margin-top:5%;
	margin-left: 50%;
	color: #fff;
	font-size: 15px;
}
input[type=text] {
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
</style>
<script type="text/javascript">


$(document).ready(function() {
    $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
})


</script>
</head>
<body>
<section>
<jsp:include page="../common/hippe_header.jsp"></jsp:include>
</section>
	<article style="margin-top: 5%; width:90%; margin-left: 30%">
	
	<!--  
	<form action="../uploadController.do" name="" method="post" enctype="multipart/form-data">
	<input type="hidden" name="command" value="insertFree">
	-->
	<form method="post" action="../uploadController.do?command=insertFree" enctype="multipart/form-data">
	<input type="hidden" name="board_category" value="free"><!-- 자유게시판 -->
	<input type="hidden" name="member_id" value="${id}"><!-- value는 나중에 ${id} 로 바꾸기 -->
	<table style="width:50%;">
		<tr>
		<th><input type="text" name="board_title" placeholder="제목을 입력하세여!!!!!!!!!!!" style=" width:100%; height:50px; margin-bottom: 1%; font-size: 30px;"/></th>
		</tr>
		<tr>
		<td><textarea name="board_content" id="summernote"></textarea></td>
		</tr>
	</table>
		<input type="submit"value="글작성하기"/>
	</form>
		
	</article>
	<section>
		<jsp:include page="../common/hippe_footer.jsp"></jsp:include>
	</section>
</body>
</html>