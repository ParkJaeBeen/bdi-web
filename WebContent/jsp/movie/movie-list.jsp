<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection con = DBCon.getCon();
String sql = "select * from movie_info";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>가격</th>
		<th>날짜</th>
		<th>기타</th>
		<th>제한</th>
		<th>평점</th>
	</tr> 
		<%
		while(rs.next())
		{
				out.println("<tr>");
				out.println("<td>" + rs.getString("mi_num") + "</td>");
				out.println("<td>" + rs.getString("mi_name") + "</td>");
				out.println("<td>" + rs.getString("mi_price") + "</td>");
				out.println("<td>" + rs.getString("mi_date") + "</td>");
				out.println("<td>" + rs.getString("mi_desc") + "</td>");
				out.println("<td>" + rs.getString("mi_age") + "</td>");
				out.println("<td>" + rs.getString("mi_star_rate") + "</td>");
				out.println("<td><a href=\"/bdi-web/jsp/movie/movie-delete.jsp?mi_num="+rs.getString("mi_num")+"\"><button>삭제하기</button></a></td>");
				out.println("</tr>"); 
		}
		%>
</table> 
<a href="/bdi-web/jsp/movie/movie-insert.jsp"><button>글쓰기</button></a> 
</body>
</html>