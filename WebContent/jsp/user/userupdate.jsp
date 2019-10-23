<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
String uiNum = request.getParameter("ui_num");
String sql = "select * from user_info where ui_num=?";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiNum);
ResultSet rs = ps.executeQuery();
if(!rs.next())
{
	out.println("번호에 해당하는 게시물 없음");
}
else
{
%>
<form method="post" action="/bdi-web/jsp/user/userupdatecode.jsp"> 
<table border="1">
			<tr>
				<th>번호</th>
				<td><%=uiNum%></td> 
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" value="<%=rs.getString("ui_id")%>">
				<br></td>
			</tr>
			<tr>
				<th>PWD</th>
				<td><input type="password" name="pwd" value="<%=rs.getString("ui_pwd")%>"><br></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="name" value="<%=rs.getString("ui_name")%>"><br></td>
			</tr>
			<tr>
				<th>AGE</th>
				<td><input type="number" name="age" value="<%=rs.getString("ui_age")%>"><br></td>
			</tr>
			<tr>
				<th>ETC</th>
				<td><input type="text" name="etc" value="<%=rs.getString("ui_etc")%>"><br></td>
			</tr>
			<tr>
					<th>hobby</th>
				<td>
					<input type="checkbox" name="hobby" value="<%=rs.getString("hobby")%>">공부
					<input type="checkbox" name="hobby" value="<%=rs.getString("hobby")%>">게임 
					<input type="checkbox" name="hobby" value="<%=rs.getString("hobby")%>">영화
					<input type="checkbox" name="hobby" value="<%=rs.getString("hobby")%>">음악
				</td>
			</tr>
			<tr>
				<td><button>수정하기</button></td> 
			</tr>
		</table>
		<input type="hidden" name="ui_num" value="<%=uiNum%>">
</form>
<% 
} 
%>
</body>
</html>