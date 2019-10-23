<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/bdi-web/jsp/user/signupinsert.jsp">  
<table border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name="id">
				<br></td>
			</tr>
			<tr>
				<th>PWD</th>
				<td><input type="password" name="pwd"><br></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="name"><br></td>
			</tr>
			<tr>
				<th>AGE</th>
				<td><input type="number" name="age"><br></td>
			</tr>
			<tr>
				<th>ETC</th>
				<td><input type="text" name="etc"><br></td>
			</tr>
			<tr>
				<th>hobby</th>
				<td>
					<input type="checkbox" name="hobby" value="study">공부
					<input type="checkbox" name="hobby" value="game">게임
					<input type="checkbox" name="hobby" value="movie">영화
					<input type="checkbox" name="hobby" value="music">음악
				</td>
			</tr> 
			<tr> 
				<td><button>회원가입</button></td> 
			</tr>
		</table>
</form>
</body>
</html>