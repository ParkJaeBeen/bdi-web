<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
 
String id = request.getParameter("id"); 
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("age");
String etc = request.getParameter("etc");
String[] hobbies = request.getParameterValues("hobby");
String hobby = "";
for(int i=0;i<hobbies.length;i++)
{
	hobby += hobbies[i] + ",";	
}
hobby = hobby.substring(0,hobby.length() -1);
out.println(hobby);

if(id != null)
{
String sql = "INSERT into user_info(ui_num,ui_id,ui_pwd,ui_name,ui_age,ui_etc,hobby) ";
sql += "values(seq_ui_num.nextval,?,?,?,?,?,?)";
Connection con = DBCon.getCon(); 
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,id);
ps.setString(2,pwd);
ps.setString(3,name);
ps.setString(4,age);
ps.setString(5,etc);
ps.setString(6,hobby);
int rs = ps.executeUpdate();
if(rs == 1)
{
	out.println("good");
	out.println("<a href=\"/bdi-web/jsp/user/idlist.jsp\"><button>idlist</button></a>");
	out.println("<a href=\"/bdi-web/jsp/user/login.jsp\"><button>로그인 화면으로</button></a>"); 
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