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
String op = request.getParameter("op");
String num1 = request.getParameter("num1");
String num2 = request.getParameter("num2");
int inum1 = Integer.parseInt(num1);
int inum2 = Integer.parseInt(num2);
if("+".equals(op))
{
out.println(inum1 + inum2);
}
else if("-".equals(op))
{
out.println(inum1 - inum2);
}
else if("*".equals(op))
{
out.println(inum1 * inum2);
}
else if("/".equals(op))
{
out.println(inum1 / inum2);
}
%>
</body>
</html>