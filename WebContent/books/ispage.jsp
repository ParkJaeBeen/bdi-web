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
Connection con = DBCon.getCon(); 

String bi_num = request.getParameter("bi_num");
String bi_image = request.getParameter("bi_image");
String bi_title = request.getParameter("bi_title");
String bi_type = request.getParameter("bi_type");
String bi_star = request.getParameter("bi_star");
String bi_credat = request.getParameter("bi_credat");
String bi_desc = request.getParameter("bi_desc");

String sql = "insert into books_info(bi_num,bi_image,bi_title,bi_type,bi_star,bi_credat,bi_desc) ";
sql += " values(SEQ_books_bi_num.nextval,'/imgs/book.jpg',?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,bi_title);
ps.setString(2,bi_type);
ps.setString(3,bi_star);
ps.setString(4,bi_credat);
ps.setString(5,bi_desc);

int rs = ps.executeUpdate();
if(rs == 1)
{
	%>
	<script>
	alert('작성 완료!');
	location.href="<%=rootPath%>/books/booklist.jsp";  
	</script>
	<% 
	con.commit();
}
else
{
	%>
	<script>
	alert("작성할게 없네요!");
	location.href="<%=rootPath%>/books/booklist.jsp";  
	</script>
	<% 
}
%>
</body>
</html>