<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
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
Connection con = DBCon.getCon();
String num = request.getParameter("num");
String sql = "delete from user_info where ui_num='" + num + "'"; 
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
if(rs.next())
{
	out.println("삭제완료");
	out.println("<a href=\"/bdi-web/jsp/user/idlist.jsp\"><button>리스트</button></a>");
	con.commit();
}

%>
</body>
</html>