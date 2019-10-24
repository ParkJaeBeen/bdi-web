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
request.setCharacterEncoding("UTF-8"); 

String ui_num = request.getParameter("ui_num");
String ui_id = request.getParameter("id");
String ui_pwd = request.getParameter("pwd");
String ui_name = request.getParameter("name");
String ui_age = request.getParameter("age");
String ui_etc = request.getParameter("etc");
String[] hobbies = request.getParameterValues("hobby");
String hobby = ""; 
for(int i=0;i<hobbies.length;i++)
{
	hobby += hobbies[i] + ",";	
}
hobby = hobby.substring(0,hobby.length() -1);
out.println(hobby);


String sql = "update user_info ";
sql += "set ui_id=?,";
sql += " ui_pwd =?,"; 
sql += " ui_name=?,"; 
sql += " ui_age=?,"; 
sql += " ui_etc=?,";
sql += " hobby=? ";
sql += " where ui_num=?";
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,ui_id);
ps.setString(2,ui_pwd);
ps.setString(3,ui_name);
ps.setString(4,ui_age);
ps.setString(5,ui_etc);
ps.setString(6,hobby);
ps.setString(7,ui_num);
System.out.println(sql);
int rs = ps.executeUpdate();
if(rs == 1)
{
	out.println("수정 완료"); 
	out.println("<a href=\"/bdi-web/jsp/user/idlist.jsp\"><button>idlist</button></a>");
	con.commit();
}
%>
</body>
</html>