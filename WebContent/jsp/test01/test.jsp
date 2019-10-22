<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
public void test(HttpServletRequest request)
{
	request.getParameter("456");
}
%>
<%
test(request);
request.getParameter("123");
response.addCookie(null);
List<String> strList = new ArrayList<String>();
%>
</body>
</html>