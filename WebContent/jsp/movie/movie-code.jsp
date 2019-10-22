<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con = DBCon.getCon();

String mi_num = request.getParameter("mi_num");
String mi_name = request.getParameter("mi_name");
String mi_price = request.getParameter("mi_price");
String mi_date = request.getParameter("mi_date");
String mi_desc = request.getParameter("mi_desc");
String mi_age = request.getParameter("mi_age");
String mi_star_rate = request.getParameter("mi_star_rate");

String sql = "insert into movie_info(mi_num, mi_name, mi_price, mi_date, mi_desc, mi_age, mi_star_rate) ";
sql += " values('" + mi_num + "','" + mi_name + "','" + mi_price + "','" + mi_date + "','" + mi_desc + "','" + mi_age + "','" + mi_star_rate +"') ";

Statement stm = con.createStatement();
int rs = stm.executeUpdate(sql);
if(rs == 1)
{
	out.println("정상작동");
	out.println("<a href=\"/bdi-web/jsp/movie/movie-list.jsp\"><button>리스트</button></a>");
	con.commit();
}
else
{
	out.println("오류");
	con.rollback();
}

%>