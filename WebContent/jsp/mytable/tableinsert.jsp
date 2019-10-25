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
Connection con = DBCon.getCon();
 
String mt_title = request.getParameter("mt_title");
String mt_content = request.getParameter("mt_content");
String mt_user = request.getParameter("mt_user");
String mt_credat = request.getParameter("mt_credat");
String mt_cretim = request.getParameter("mt_cretim");

String sql = "insert into mytable(mt_num,mt_user,mt_title,mt_content,mt_credat,mt_cretim)";
sql += "values(SEQ_mytable_mt_num.nextval,?,?,?,TO_CHAR(sysdate,'YYYY-MM-DD'),TO_CHAR(sysdate,'HH24:MI:SS'))";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,mt_title);
ps.setString(2,mt_user);
ps.setString(3,mt_content);
int rs = ps.executeUpdate();
if(rs == 1)
{
%>
<script>
alert("작성완료!");
location.href="/bdi-web/jsp/mytable/table.jsp";
</script>
<%
con.commit();
}
%>
</body>
</html>