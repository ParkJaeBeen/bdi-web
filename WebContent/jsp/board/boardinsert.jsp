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

String biTitle = request.getParameter("bi_title"); 
String biUser = request.getParameter("bi_user");
String biContent = request.getParameter("bi_content");
String biCredat = request.getParameter("bi_credat");
String biCretim = request.getParameter("bi_cretim");
String biModdat = request.getParameter("bi_moddat");
String biModtim = request.getParameter("bi_modtim");

String sql = "INSERT into board_info(bi_num,bi_title,bi_user,bi_content,bi_credat,bi_cretim,bi_moddat,bi_modtim) ";
sql += "values(seq_ui_num.nextval,?,?,?,TO_CHAR(sysdate,'YYYYMMDD'),TO_CHAR(SYSDATE,'HH24MISS'),TO_CHAR(sysdate,'YYYYMMDD'),TO_CHAR(SYSDATE,'HH24MISS'))";
if(biTitle != null)
{
Connection con = DBCon.getCon(); 
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,biTitle);
ps.setString(2,biUser);
ps.setString(3,biContent);

int rs = ps.executeUpdate();
if(rs == 1)
{
	out.println("good");
	out.println("<a href=\"/bdi-web/jsp/board/board.jsp\"><button>게시판으로</button></a>");
}
else
{
	out.println("오류");
	con.rollback();
}
con.commit();
}
%>
</body>
</html>