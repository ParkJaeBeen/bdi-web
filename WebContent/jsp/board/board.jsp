<%@page import="java.sql.ResultSet"%>
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
<form>
	<select name="search">
		<option value="bi_title">제목</option>
		<option value="bi_user">작성자</option>
		<option value="bi_content">내용</option>
		<option value="bi_title,bi_user">제목 + 작성자</option>
	</select> : <input type="text" name="serStr"><button>검색</button>
</form>
<body>
		<table border="1">
			<tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>작성시간</th>
				<th>수정날짜</th>
				<th>수정시간</th>
			</tr>
			<%
			String s = request.getParameter("search");
			String serStr = request.getParameter("serStr");
			
			Connection con = DBCon.getCon(); 
			String sql = "select * from board_info ";
			
			if(s != null)
			{
				sql += "where ";
				if("bi_title".equals(s))
				{
					sql += "bi_title like ?"; 
				}
				else if("bi_user".equals(s))
				{
					sql += "bi_user like ?";
				}
				else if("bi_title,bi_user".equals(s))
				{
					sql += "bi_title like ? or bi_user like ?"; 
				}
				else
				{
					sql += "";
				}
			}
			sql += " order by bi_num desc";
			
			PreparedStatement ps = con.prepareStatement(sql);
			if(s != null)
			{
				if("bi_title".equals(s) || "bi_user".equals(s))
				{
					ps.setString(1,"%"+ serStr +"%");  
				}
				else if("bi_title,bi_user".equals(s))
				{
					ps.setString(1,"%"+ serStr +"%"); 
					ps.setString(2,"%"+ serStr +"%");
				}
			}
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) 
			{ %>
			<tr>
				<td><%=rs.getString("bi_num")%></td> 
				<td><%=rs.getString("bi_title")%></td>
				<td><%=rs.getString("bi_user")%></td>
				<td><%=rs.getString("bi_credat")%></td>
				<td><%=rs.getString("bi_cretim") %></td>   
				<td><%=rs.getString("bi_moddat")%></td>
				<td><%=rs.getString("bi_modtim") %></td> 
				<td><a href="/bdi-web/jsp/board/boarddelete.jsp?bi_num=<%=rs.getString("bi_num")%>"><button>삭제</button></a></td>
				<td><a href="/bdi-web/jsp/board/boardupdate.jsp?bi_num=<%=rs.getString("bi_num")%>"><button>수정</button></a></td>
			</tr>
			<%} %>
		</table>
	<a href="/bdi-web/jsp/board/boardispage.jsp"><button>글작성</button></a>
	<a href="/bdi-web/jsp/mytable/totaltable.jsp"><button>처음으로돌아가기</button></a>
</body>
</html>