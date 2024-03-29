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
<form>
<select name="search">
	<option value="ui_id">ID</option>
	<option value="ui_name">이름</option>
	<option value="ui_age">나이</option>
	<option value="ui_etc">기타</option>
</select> : <input type="text" name="searchStr"><button>검색</button>
</form>
<table border="1">
	<tr>
		<th>num</th>
		<th>id</th>
		<th>pwd</th>
		<th>name</th>
		<th>age</th>
		<th>etc</th>
		<th>hob</th>
	</tr>
<%
String sc = request.getParameter("search");
String sstr = request.getParameter("searchStr");

String sql = "select * from USER_INFO ";
if(sc != null)
{
	sql += "where ";
	if("ui_id".equals(sc))
	{
		sql += "ui_id";
	}
	else if("ui_name".equals(sc))
	{
		sql += "ui_name";
	}
	else if("ui_age".equals(sc))
	{
		sql += "ui_age";
	}
	else if("ui_etc".equals(sc))
	{
		sql += "ui_etc";
	}
	else
	{
		sql +="";
	}
	sql += " like ?";  
}
sql += " order by ui_num desc";
Connection con = DBCon.getCon(); 
PreparedStatement ps = con.prepareStatement(sql);
if(sc != null)
{
	if("ui_id".equals(sc) || "ui_name".equals(sc) || "ui_age".equals(sc) || "ui_etc".equals(sc))
	{
		ps.setString(1,"%"+ sstr +"%");  
	}
}
ResultSet rs = ps.executeQuery();
while(rs.next())
{
%>
		<tr>
			<td><%=rs.getString("ui_num")%></td> 
			<td><a href="/bdi-web/jsp/user/userupdate.jsp?ui_num=<%=rs.getString("ui_num")%>"><%=rs.getString("ui_id")%></a></td>
			<td><%=rs.getString("ui_pwd")%></td>
			<td><%=rs.getString("ui_name")%></td>
			<td><%=rs.getString("ui_age")%></td>
			<td><%=rs.getString("ui_etc")%></td> 
			<td><%=rs.getString("hobby") %></td>
			<td><a href="/bdi-web/jsp/user/signupdelete.jsp?ui_num=<%=rs.getString("ui_num")%>"><button>삭제하기</button></a></td>
		</tr> 
		<%} %>
</table>
<a href="/bdi-web/jsp/user/login.jsp"><button>로그인창으로돌아가기</button></a><br>
<a href="/bdi-web/jsp/mytable/totaltable.jsp"><button>처음으로돌아가기</button></a>
</body>
</html>