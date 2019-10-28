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
request.setCharacterEncoding("UTF-8");

String bi_num = request.getParameter("bi_num");
String bi_title = request.getParameter("bi_title");
String bi_type = request.getParameter("bi_type");
String bi_star = request.getParameter("bi_star");
String bi_desc = request.getParameter("bi_desc");

Connection con = DBCon.getCon();
String sql = "update books_info ";
sql += "set bi_title=?,";
sql += " bi_type=?,";
sql += " bi_star=?,";
sql += " bi_desc=?";
sql += " where bi_num=?";

PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,bi_title);
ps.setString(2,bi_type);
ps.setString(3,bi_star);
ps.setString(4,bi_desc);
ps.setString(5,bi_num);

int rs = ps.executeUpdate();

if(rs == 1)
{
%>
<script>
alert('수정 완료');
location.href="<%=rootPath%>/books/booklist.jsp";
</script>
<%
}
else
{
	out.println("뒤로가기"); 
}
%>
</body>
</html>