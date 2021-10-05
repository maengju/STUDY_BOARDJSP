<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<style type="text/css">

div{
	font-size: 8pt;
	color: red;
	font-weight: bold;
	
}



</style>


</head>
<body>

<h1>글쓰기</h1>
<form name="boardWriteForm" method="post" action="http://localhost:8080/boardJSP/board/boardWrite.jsp">

	<table border="1" cellspacing="0" cellpadding="5" width="550px">
		<tr>
			<td width="100"  height="30"  align="center">제목</td>
			<td>
				<input type="text" name="subject" id="subject" size="45">
				<div id="subjectDiv"></div>
			</td>
		
		</tr>
		
		<tr>
			<td width="100" align="center">내용</td>
			<td>
				<textarea name="content" id="content" rows="12" cols="50" ></textarea>
				<div id="contentDiv"></div>
			</td>
		
		</tr>
	
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글쓰기" id="boardWriteBtn">
				<input type="reset" value="다시작성">
				<input type="button" value="글 목록" onclick="location.href='boardList.jsp?pg=1'">
			</td>
		</tr>
	
	
	
	
	
	
	
	
	
	</table>










</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/boardJSP/js/board.js"></script>




</body>
</html>