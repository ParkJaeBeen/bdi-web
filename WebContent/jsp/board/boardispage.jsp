<%@page import="java.sql.ResultSet"%>
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
<form method="post" action="/bdi-web/jsp/board/boardinsert.jsp">  
<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="bi_title"> <br></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bi_user"><br></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea type="text" name="bi_content"></textarea><br></td>
			</tr>
			<tr>
			<td><button>작성완료</button></td>
			</tr>
		</table>
</form>
<a href="/bdi-web/jsp/board/board.jsp"><button>취소</button></a> 
</body>
</html>