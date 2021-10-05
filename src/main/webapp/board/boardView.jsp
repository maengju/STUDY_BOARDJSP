<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="board.bean.BoardDTO" %>
    <%@ page import="board.dao.BoardDAO" %>
    <%@ page  import="java.util.ArrayList"  %>
    <%@ page  import="java.util.List"  %>
    
<%
List<BoardDTO> list= new ArrayList<BoardDTO>();

request.setCharacterEncoding("UTF-8");
int seq = Integer.parseInt(request.getParameter("seq"));

BoardDAO boardDAO = BoardDAO.getInstance();
list = boardDAO.view(seq);

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardView</title>
<style type="text/css">
table{
	border-bottom: 1px;
	border-top: 1px;
	
}




</style>
</head>
<body>

	<table rules="rows">
		<tr>
			<td colspan="3" align="center">
				<h1><%=list.get(0).getSubject()%></h1>
			</td>
			
		</tr>
		<tr>
			<td width="150" align="center">
				글번호 : <%=list.get(0).getSeq() %>
			</td >
			<td width="150" align="center">
				작성자 : <%=list.get(0).getId() %>
			</td>
			
			<td width="150" align="center">
				조회수 : <%=list.get(0).getHit() %>
			</td>
		</tr>
		
		<tr height="200">
			<td colspan="3" align="center">
				<pre><%=list.get(0).getContent() %></pre>
			</td>
		</tr>
		
		
		<tr >
			<td colspan="3" align="center">
				<input type="button" value="글 쓰기" onclick="location.href='boardWriteForm.jsp'">
				<input type="button" value="글 목록" onclick="location.href='boardList.jsp?pg=1'">

			</td>
		</tr>
	
	
	</table>


</body>
</html>