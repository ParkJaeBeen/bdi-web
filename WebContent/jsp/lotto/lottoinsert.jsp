<%@page import="com.bdi.test.test01.Lotto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
Lotto lotto = new Lotto();
List<Integer> lottoList = lotto.getLotto();

request.setCharacterEncoding("UTF-8");
Connection con = DBCon.getCon();
String seq = request.getParameter("seq");
String num1 = lottoList.get(0) + "";
String num2 = lottoList.get(1) + "";
String num3 = lottoList.get(2) + "";
String num4 = lottoList.get(3) + "";
String num5 = lottoList.get(4) + "";
String num6 = lottoList.get(5) + "";

String sql = "insert into lotto(seq,num1,num2,num3,num4,num5,num6)";
sql += "values(seq_lotto_seq.nextval,?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,num1);
ps.setString(2,num2);
ps.setString(3,num3);
ps.setString(4,num4);
ps.setString(5,num5);
ps.setString(6,num6);
int rs = ps.executeUpdate();
if(rs == 1)
{
	out.println("성공");
	out.println("<a href=\"/bdi-web/jsp/lotto/lottopage.jsp\"><button>돌아가기</button></a>"); 
	con.commit();
}
else
{
	out.println("실패");
	out.println("<a href=\"/bdi-web/jsp/lotto/lottopage.jsp\"><button>돌아가기</button></a>"); 
	con.commit();
}
%>
</body>
</html>