<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/bdi-web/jsp/mytable/tableinsert.jsp">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mt_title"><br></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="mt_user"><br></td>
		</tr>
		<tr> 
			<th>내용</th>
			<td><textarea type="text" name="mt_content"></textarea><br></td>
		</tr>
		<tr>
			<td><button>작성완료</button></td>
		</tr>
	</table>
	</form>
</body>
</html>