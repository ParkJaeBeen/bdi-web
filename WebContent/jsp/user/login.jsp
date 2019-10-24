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
request.setCharacterEncoding("UTF-8"); 
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
if(id != null)
{
	String sql = "select * from user_info where ui_id = ? and ui_pwd = ? ";
	Connection con = DBCon.getCon();
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,id);
	ps.setString(2,pwd);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
		out.println("sucess");
%>
<script>
alert("<%=rs.getString("ui_name")%>님 로그인이 성공하셨습니다.");
location.href="/bdi-web/jsp/user/idlist.jsp";
</script>
<%
	}
	else
	{
		out.println("wrong id pwd");
	}
}
%>
<form method="post">
	ID  : <input type="text" name="id"><br>
	PWD : <input type="password" name="pwd"><br>
	<button>로그인</button>
</form>
<a href="/bdi-web/jsp/user/signuppage.jsp"><button>회원가입</button></a>
</body>
</html>