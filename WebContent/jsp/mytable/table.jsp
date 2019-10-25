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
	<table border="1" style="text-align:center"> 
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>시간</th>
			<th>수정날짜</th>
			<th>수정시간</th>
		</tr>
		<%
			Connection con = DBCon.getCon();
			String sql = "select * from mytable ";
			sql += "order by mt_num desc";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			%>
		<tr>
			<td><%=rs.getString("mt_num")%></td>
			<td width="500"><%=rs.getString("mt_title")%></td> 
			<td><%=rs.getString("mt_user")%></td>
			<td><%=rs.getString("mt_credat")%></td>
			<td><%=rs.getString("mt_cretim")%></td>
			<td><%=rs.getString("mt_moddat")%></td>
			<td><%=rs.getString("mt_modtim")%></td>
		</tr>
		<%
		}
		%>
	</table>
<a href="/bdi-web/jsp/mytable/tableispage.jsp"><button>글쓰기</button></a>
</body>
</html>