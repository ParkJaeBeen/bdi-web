<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
movie-number : <%=request.getParameter("mi_num")%>
<%
Connection con = DBCon.getCon();
String mi_num = request.getParameter("mi_num");
String sql = "delete from movie_info where mi_num='" + mi_num + "'";
Statement stm = con.createStatement();
int rs = stm.executeUpdate(sql);
if(rs == 1)
{
	out.println("삭제완료");
	out.println("<a href=\"/bdi-web/jsp/movie/movie-list.jsp\"><button>리스트</button></a>");
	con.commit();
}
%>
</body>
</html>