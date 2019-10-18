<%@page import="java.sql.Statement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("age");
String etc = request.getParameter("etc");
if(id!=null)
{
out.println("your id : " + id + "<br>");
out.println("your pwd : " + pwd + "<br>");
out.println("your name : " + name + "<br>");
out.println("your age : " + age + "<br>");
out.println("etc : " + etc + "<br>"); 

Connection con = DBCon.getCon();
Statement stm = con.createStatement();
String sql = " insert into user_info(ui_id, ui_pwd, ui_name, ui_age, ui_etc) ";
sql += " values('" + id + "','" + pwd + "','" + name + "','" + age + "','" + etc + "') ";
int result = stm.executeUpdate(sql);
	if(result == 1)
	{
		out.println("회원가입 완료");
	}
	con.commit(); 
}
%>

<a href="/bdi-web/jsp/signup.jsp">돌아가기</a>