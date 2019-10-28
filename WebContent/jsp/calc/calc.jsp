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
public void test(JspWriter out) throws Exception
{
	out.println("hahahah");
}
%>
	<%
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		String op = request.getParameter("op");
		int result = 0;
		if (num1 != null) 
		{
			int inum1 = Integer.parseInt(num1);
			int inum2 = Integer.parseInt(num2);

			if ("+".equals(op)) 
			{
				result = inum1 + inum2;
			} 
			else if ("-".equals(op)) 
			{
				result = inum1 - inum2;
			}
			else if ("*".equals(op)) 
			{
				result = inum1 * inum2;
			} 
			else if ("/".equals(op)) 
			{
				result = inum1 / inum2;
			}
		}
	%>
	<form>
		숫자1 : <input type="number" name="num1"> <select name="op">
			<option value="+">더하기</option>
			<option value="-">빼기</option>
			<option value="*">곱하기</option>
			<option value="/">나누기</option>
		</select> 숫자2 : <input type="number" name="num2"> = 
		<input type="number" name="result" value="<%=result%>">
		<button>계산</button>
	</form>
	<a href="/bdi-web/jsp/mytable/totaltable.jsp"><button>처음으로돌아가기</button></a>
</body>
</html>