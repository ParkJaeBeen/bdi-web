<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
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
<%
String bi_num = request.getParameter("bi_num"); 

String sql = "select * from books_info where bi_num=?";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,bi_num);

ResultSet rs = ps.executeQuery();
while(rs.next())
{
%>
<form method="post" action="<%=rootPath%>/books/updatecode.jsp">
	<table border="1">
			<tr>
				<th>번호</th>
				<td><%=bi_num%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="bi_title"></td>
			</tr>
			<tr>
				<th>타입</th>
				<td><input type="text" name="bi_type"></td> 
			</tr>
			<tr>
				<th>평점</th>
				<td><input type="text" name="bi_star"></td>
			</tr>
			<tr>
				<th>생성날짜</th>
				<td><input type="number" name="bi_credat"></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea type="text" name="bi_desc"></textarea></td>
			</tr>
			<tr>
				<td><button>작성완료</button></td>
			</tr> 
		</table>
		<input type="hidden" name="bi_num" value="<%=bi_num%>"> 
</form>
<%
}
%>
</body>
</html>