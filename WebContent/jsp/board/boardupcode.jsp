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

String biNum = request.getParameter("bi_num");
String biTitle = request.getParameter("bi_title"); 
String biUser = request.getParameter("bi_user");
String biContent = request.getParameter("bi_content");
String biModdat = request.getParameter("bi_moddat");
String biModtim = request.getParameter("bi_modtim");

Connection con = DBCon.getCon();
String sql = "update board_info ";
sql += "set bi_title=?,";
sql += " bi_user=?,";
sql += " bi_content=?,";
sql += " bi_moddat=TO_CHAR(sysdate,'YYYYMMDD'),";
sql += " bi_modtim=TO_CHAR(SYSDATE,'HH24MISS')";
sql += " where bi_num='" + biNum + "'"; 
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,biTitle);
ps.setString(2,biUser);
ps.setString(3,biContent);


int result = ps.executeUpdate();

if(result == 1)
{
	out.println("수정 완료"); 
	out.println("<a href=\"/bdi-web/jsp/board/board.jsp\"><button>게시판 돌아가기</button></a>");
	con.commit();
}
%>
</body>
</html>