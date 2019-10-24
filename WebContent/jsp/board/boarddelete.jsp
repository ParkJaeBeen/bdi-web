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
<%
Connection con = DBCon.getCon(); 
String biNum = request.getParameter("bi_num");
String sql = "delete from board_info where bi_num='" + biNum + "'";  
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
if(rs.next()) 
{  
	out.println("삭제완료");
	out.println("<a href=\"/bdi-web/jsp/board/board.jsp\"><button>게시판 돌아가기</button></a>");
	con.commit();
}
else
{
	out.println("작성된 글이 없습니다.");
	out.println("<a href=\"/bdi-web/jsp/board/board.jsp\"><button>게시판 돌아가기</button></a>");
}
%>
</body>
</html>