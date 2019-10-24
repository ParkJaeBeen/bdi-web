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
<%
String biNum = request.getParameter("bi_num");
String sql = "select * from board_info where bi_num=?";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,biNum);
ResultSet rs = ps.executeQuery();
if(!rs.next())
{
	out.println(biNum + "번째 글은 존재하지 않습니다.");
}
else
{
%>
<form action="/bdi-web/jsp/board/boardupcode.jsp">
		<table>
			<tr>
				<th>번호</th>
				<td><%=biNum%></td>
				<input type="hidden" name="bi_num" value="<%=biNum%>">
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="bi_title" value="<%=rs.getString("bi_title")%>"> <br></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bi_user" value="<%=rs.getString("bi_user")%>"><br></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea type="text" name="bi_content" cols="22" rows="10"><%=rs.getString("bi_content")%></textarea><br></td> 
			</tr>
			<tr>
				<td><button>작성완료</button></td>
			</tr>
		</table>
	</form>
<%
}
%>
</body>
</html>