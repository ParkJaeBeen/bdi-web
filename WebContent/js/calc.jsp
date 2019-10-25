<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
숫자 1 : <input type="number" id="num1">
+
숫자 2 : <input type="number" id="num2">
<button onclick="calc();"> = </button>
<script>
	function calc()
	{
		var num1 = document.getElementById("num1");
		var num2 = document.getElementById("num2");
		
		alert(parseInt(num1.value) == parseInt(num2.value));
		alert(Number(num1.value) == Number(num2.value));
		if(Number(num1.value) == parseInt(num2.value))
		{
		alert("true");
		}		
	}
</script>
</body>
</html>