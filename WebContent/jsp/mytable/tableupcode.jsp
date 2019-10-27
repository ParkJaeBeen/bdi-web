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
request.setCharacterEncoding("UTF-8");

String mt_num = request.getParameter("mt_num");
String mt_title = request.getParameter("mt_title");
String mt_content = request.getParameter("mt_content");
String mt_moddat = request.getParameter("mt_moddat");
String mt_modtim = request.getParameter("mt_modtim");

Connection con = DBCon.getCon();
String sql = "update mytable ";
sql += "set mt_title=?,";
sql += " mt_content=?,";
sql += " mt_moddat=TO_CHAR(sysdate,'YYYY-MM-DD'),";
sql += " mt_modtim=TO_CHAR(sysdate,'HH24:MI:SS')";
sql += " where mt_num=?"; 

PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,mt_title);
ps.setString(2,mt_content);
ps.setString(3,mt_num);

int rs = ps.executeUpdate();
if(rs == 1)
{
	%>
	<script> 
	alert("수정완료!");
	location.href="/bdi-web/jsp/mytable/table.jsp";
	</script>
	<%
	con.commit();
}
else
{
	out.println("업데이트 할 내용이 없네요?"); 
}
%>
</body>
</html>