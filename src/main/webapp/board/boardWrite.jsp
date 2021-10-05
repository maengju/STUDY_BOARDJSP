<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="board.bean.BoardDTO" %>
    <%@ page import="board.dao.BoardDAO" %>
    
<%
	//data
	request.setCharacterEncoding("UTF-8");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String name = "맹주혁";
	String id = "maeng2594";
	String email = "1188gur@naver.com";

	BoardDTO boardDTO = new BoardDTO();
	
	boardDTO.setId(id);
	boardDTO.setName(name);
	boardDTO.setEmail(email);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	

	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	boardDAO.write(boardDTO);
	
	
	
	//응답





%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글쓰기 성공<br>

<input type="button" value="글 쓰기" onclick="location.href='boardWriteForm.jsp'">
<input type="button" value="글 목록" onclick="location.href='boardList.jsp?pg=1'">

</body>
</html>