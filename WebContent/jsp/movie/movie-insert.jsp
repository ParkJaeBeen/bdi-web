<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="/bdi-web/jsp/movie/movie-code.jsp">
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>가격</th>
		<th>날짜</th>
		<th>설명</th>
		<th>제한</th>
		<th>평점</th> 
	</tr>
	<tr>
		<td><input type="number" name="mi_num"></td>
		<td><input type="text" name="mi_name"></td>
		<td><input type="number" name="mi_price"></td>
		<td><input type="number" name="mi_date"></td>
		<td><input type="text" name="mi_desc"></td>
		<td><input type="number" name="mi_age"></td>
		<td><input type="text" name="mi_star_rate"></td> 
	</tr> 
</table>
<a href="/bdi-web/movie/movie-list.jsp"><button>작성완료</button></a>
</form>
<body>
</html>