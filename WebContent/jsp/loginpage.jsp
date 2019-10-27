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
<body style="text-align:center;">
<h2>로그인 화면</h2>
<%
request.setCharacterEncoding("UTF-8"); 
String id = request.getParameter("id_id");
String pwd = request.getParameter("id_pwd");
if(id != null)
{
	String sql = "select * from idlist where id_id = ? and id_pwd = ? ";
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
alert("<%=rs.getString("id_id")%>님 환영합니다");
location.href="/bdi-web/jsp/mytable/totaltable.jsp";
</script>
<%
	}
	else
	{
		%>
		<script>
		alert("다른 아이디이거나 다른 비밀번호를 입력했습니다.");
		location.href="/bdi-web/jsp/loginpage.jsp";
		</script>
		<%
	}
}
%>
			<form method="post">
				아이디    :<input type="text" name="id_id"><br>
				비밀번호 :<input type="password" name="id_pwd"><br> 
				<button>로그인</button>
			</form>
			<a href="/bdi-web/jsp/mytable/logispage.jsp"><button>회원가입</button></a>
</body> 
</html>