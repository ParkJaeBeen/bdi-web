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
<body style="text-align:center;">
<h2>게 시 판</h2> 
	<table style="text-align:center; margin-left: auto; margin-right: auto;"> 
		<tr>
			<th>번호</th>
			<th width="800">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>시간</th>
			<th>수정날짜</th>
			<th>수정시간</th>
		</tr>
		<%
			String s = request.getParameter("search");
			String sstr = request.getParameter("serStr");
			Connection con = DBCon.getCon();
			String sql = "select * from mytable ";
			if(s != null)
			{
				sql += "where ";
				if("mt_title".equals(s))
				{
					sql += "mt_title like ?";
				}
				else if("mt_user".equals(s))
				{
					sql += "mt_user like ?";
				}
				else if("mt_content".equals(s))
				{
					sql += "mt_content like ?";
				}
				else if("mt_credat".equals(s))
				{
					sql += "mt_credat like ?";
				}
				else
				{
					sql += "";
				}
			}
			
			sql += "order by mt_num desc";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			if(s != null)
			{
				if("mt_title".equals(s) || "mt_user".equals(s) || "mt_content".equals(s) || "mt_credat".equals(s))
				{
					ps.setString(1,"%"+ sstr +"%");  
				} 
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			%> 
		<tr>
			<td><%=rs.getString("mt_num")%></td>
			<td><a href="/bdi-web/jsp/mytable/tablecontent.jsp?mt_num=<%=rs.getString("mt_num")%>" style="text-decoration:none"><%=rs.getString("mt_title")%></a></td> 
			<td><%=rs.getString("mt_user")%></td>
			<td><%=rs.getString("mt_credat")%></td>
			<td><%=rs.getString("mt_cretim")%></td>
			<td><%=rs.getString("mt_moddat")%></td>
			<td><%=rs.getString("mt_modtim")%></td>
			<td><a href="/bdi-web/jsp/mytable/tabledelete.jsp?mt_num=<%=rs.getString("mt_num")%>"><button>삭제</button></a></td>
		</tr>
		<%
		}
		%>
		<tr> 
			<td colspan="7" align="center"> 
				<form>
					<select name="search">
						<option value="mt_title">제목</option>
						<option value="mt_user">작성자</option>
						<option value="mt_content">내용</option>
						<option value="mt_credat">날짜</option>
					</select> : <input type="text" name="serStr">
					<button>검색</button>
				</form>
			</td>
			<td>
				<a href="/bdi-web/jsp/mytable/tableispage.jsp"><button>글쓰기</button></a>
			</td>
		</tr>
	</table>
	<a href="/bdi-web/jsp/mytable/totaltable.jsp"><button>처음으로돌아가기</button></a>
</body>
</html>