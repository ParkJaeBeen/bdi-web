<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/first.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" style="text-align:center; margin-left: auto; margin-right: auto;">
		<tr>
			<th width="800">여태까지 만든 table</th>
		</tr>
		<tr>
			<td><a href="<%=rootPath%>/jsp/board/board.jsp">board</a></td>
		</tr>
		<tr>
			<td><a href="<%=rootPath%>/jsp/calc/calc.jsp">calc</a></td>
		</tr>
		<tr>
			<td><a href="<%=rootPath%>/jsp/user/login.jsp">user</a></td>
		</tr>
		<tr>
			<td><a href="<%=rootPath%>/jsp/lotto/lottopage.jsp">lotto</a></td>
		</tr>
		<tr>
			<td><a href="<%=rootPath%>/jsp/mytable/table.jsp">mytable</a></td>
		</tr>
		<tr>
			<td><a href="<%=rootPath%>/books/booklist.jsp">booklist</a></td>
		</tr>
		<tr>
			<td><a href="<%=rootPath%>/jsp/loginpage.jsp"><button>로그인 화면으로 돌아가기</button></a></td> 
		</tr>
</table>
</body>
</html>