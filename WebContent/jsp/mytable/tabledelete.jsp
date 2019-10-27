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
<script>
function yesorno(){
 if(confirm("삭제하시겠습니까?"))
 {
  location.href="/bdi-web/jsp/mytable/table.jsp";
 }
 else
 {
 alert('이거도삭제되요 ㅎㅎ;;');
 location.href="/bdi-web/jsp/mytable/table.jsp";
 }
}
</script>
<%
String mt_num = request.getParameter("mt_num");

Connection con = DBCon.getCon();
String sql = "delete from mytable where mt_num=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,mt_num);
int rs = ps.executeUpdate();
if(rs == 1)
{
%>
<script>
yesorno();
</script>
<%
con.commit();
}
else
{
	out.println("삭제할 값이 없군요?");
}
%>
</body>
</html>