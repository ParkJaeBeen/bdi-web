<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String mt_num = request.getParameter("mt_num");
String sql = "select * from mytable where mt_num=?";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,mt_num);
ResultSet rs = ps.executeQuery();
while(rs.next())
{
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<td><%=mt_num%></td>
			<input type="hidden" name="mt_num" value="<%=mt_num%>">
		</tr>
		<tr>
			<th>제목</th>
			<td><%=rs.getString("mt_title")%><br></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=rs.getString("mt_user")%><br></td>
		</tr>
		<tr> 
			<th>내용</th>
			<td><textarea cols="22" rows="10"><%=rs.getString("mt_content")%></textarea><br></td>
		</tr>
		<tr> 
			<td><a href="/bdi-web/jsp/mytable/tableupdate.jsp?mt_num=<%=rs.getString("mt_num")%>"><button>수정</button></a></td>
		</tr>
	</table>
<%
}
%>	
</body>
</html>