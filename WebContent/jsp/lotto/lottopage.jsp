<%@page import="com.bdi.test.test01.Lotto"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Lotto lotto = new Lotto();
List<Integer> lottoList = lotto.getLotto();

String seq = request.getParameter("seq");
String num1 = lottoList.get(0) + "";
String num2 = lottoList.get(1) + "";
String num3 = lottoList.get(2) + "";
String num4 = lottoList.get(3) + "";
String num5 = lottoList.get(4) + "";
String num6 = lottoList.get(5) + "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/bdi-web/jsp/lotto/lottoinsert.jsp">
	<table border="1">
		<tr>
			<th>회차</th>
			<th>1번</th>
			<th>2번</th>
			<th>3번</th>
			<th>4번</th>
			<th>5번</th>
			<th>6번</th>
		</tr>
		<%
			Connection con = DBCon.getCon();
			String sql = "select * from lotto ";
			sql += "order by seq desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{ 
			%>
		<tr>
			<td><%=rs.getString("seq")%></td>
			<td><%=rs.getString("num1")%></td>
			<td><%=rs.getString("num2")%></td>
			<td><%=rs.getString("num3")%></td>
			<td><%=rs.getString("num4")%></td>
			<td><%=rs.getString("num5")%></td>
			<td><%=rs.getString("num6")%></td>
		</tr>
	<%
	}
	%>
	</table>
</form>
<a href="/bdi-web/jsp/lotto/lottoinsert.jsp"><button>번호뽑기</button></a>
</body>
</html>