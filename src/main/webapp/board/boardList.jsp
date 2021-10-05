<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="board.bean.BoardDTO" %>
    <%@ page import="board.dao.BoardDAO" %>
      <%@ page  import="java.util.ArrayList"  %>
    <%@ page  import="java.util.List"  %>
 
<%
List<BoardDTO> list= new ArrayList<BoardDTO>();

//data
request.setCharacterEncoding("UTF-8");
int pg = Integer.parseInt(request.getParameter("pg"));

//db

response.setContentType("text/html;charset=UTF-8"); 

//페이징 처리 한페이지당 5개
int endNum = pg*5;
int startNum = endNum-4;

BoardDAO boardDAO = BoardDAO.getInstance();
list = boardDAO.printList(startNum,endNum);

int totalA = boardDAO.getTotalA(); //총글수
int totalP = (totalA+4)/5; //페이지 번호



%> 
 
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>

<style type="text/css">

table{
	border-bottom: 1px;
	border-top: 1px;
	
}
#currentPagingA{
	color: blue;
	text-decoration: underline;
}

#pagingA{
	color:black;
	text-decoration: none;
}
.subject{
	text-decoration: none;
	color:black;
}
.subject:link{
	color:black; text-decoration: none;
}
.subject:visited{
	color:black; text-decoration: none;
}
.subject:hover{
	color:green;
	text-decoration: underline;
}
.subject:active{
	color:black; text-decoration: none;
}

div{
	width: 600px;
	text-align: center;
}

#writeBtn{
	text-align:right;
}
</style>




</head>
<body>

<form name="boardList" method="get" action="http://localhost:8080/boardJSP/board/boardView.jsp">
	
	<table rules="rows">
		<tr id="writeBtn" ><td colspan="5" align="right"><input type="button" value="글 쓰기" onclick="location.href='boardWriteForm.jsp'"><td></tr>
		<tr>
			<td width="100" align="center">글번호</td>
			<td width="200" align="center">제목</td>
			<td width="70" align="center">작성자</td>
			<td width="70" align="center">조회수</td>
			<td width="150" align="center">작성일</td>
		</tr>
		<%if(list!=null){ %>
			<%for(int i=0; i<list.size(); i++){ %>
				<tr >
					<td align="center"><%=list.get(i).getSeq() %></td>
					<td align="center"><a href="boardView.jsp?seq=<%=list.get(i).getSeq()%>&pg=<%=pg %>"  class="subject" ><%=list.get(i).getSubject() %></a></td>
					<td align="center"><%=list.get(i).getId() %></td>
					<td align="center"><%=list.get(i).getHit() %></td>
					<td align="center"><%=list.get(i).getLogtime() %></td>
		
		
			<%} %>
		<%} %>
	</table>

	<div >
	<% for(int i=1; i<=totalP; i++) {%>
		<%if(i==pg) {%>
			 [<a href="boardList.jsp?pg=<%=i %>" id="currentPagingA"><%=i%></a>]
		
		<%}else{ %>
			 [<a href="boardList.jsp?pg=<%=i %>" id="pagingA"><%=i%></a>]
		<% } %>
		
	<%} %>
	
	</div>


</form>


</body>
</html>