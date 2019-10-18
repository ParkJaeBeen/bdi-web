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
/*int a = 10;
out.println(a);
String str = "abcdefg";
out.println(str);
boolean b = true;
out.println(b);*/
String trans = request.getParameter("trans");
if("male".equals(trans))
{
	out.println("남자");
}
else if("female".equals(trans))
{
	out.println("여자");
}
else
{
	out.println("nothing");
}
%>
확인
</body>
</html>