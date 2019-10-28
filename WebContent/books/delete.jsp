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
Connection con = DBCon.getCon();
String bi_num = request.getParameter("bi_num");
String sql = "delete from books_info where bi_num=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,bi_num);

int rs = ps.executeUpdate();
if(rs == 1)
{
%>
<script>
	alert("삭제완료!");
	location.href="<%=rootPath%>/books/booklist.jsp"; 
</script>
<%
	con.commit();
}
else
{
	out.println("뒤로가세요"); 
}
%>
</body>
</html>