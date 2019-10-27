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

String id_num = request.getParameter("id_num");
String id_id = request.getParameter("id_id");
String id_pwd = request.getParameter("id_pwd");

String sql = "insert into IDLIST(id_num,id_id,id_pwd) ";
sql += "values(SEQ_IDLIST_ID_num.nextval,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,id_id);
ps.setString(2,id_pwd);
int rs = ps.executeUpdate();
if(rs == 1)
{
%>
<script>
alert("회원가입 완료");
location.href="/bdi-web/jsp/loginpage.jsp";
</script>
<%
con.commit();
}
else
{
	%>
	<script>
	alert("회원가입 실패");
	location.href="/bdi-web/jsp/loginpage.jsp";
	</script>
	<%
}
%>
</body>
</html>