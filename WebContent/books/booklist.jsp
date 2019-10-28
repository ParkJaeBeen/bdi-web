<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/first.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1"
		style="text-align: center; margin-left: auto; margin-right: auto;">
		<tr>
			<th>번호</th>
			<th>이미지</th>
			<th>제목</th>
			<th>타입</th>
			<th>평점</th>
			<th>생성날짜</th>
			<th>기타</th>
		</tr>
		<%
			String search = request.getParameter("search");
			String serStr = request.getParameter("serStr");

			Connection con = DBCon.getCon();
			String sql = "select bi.bi_num, bi.bi_image, bi.bi_title, bi.bi_desc, bi.bi_star, bi.bi_credat,";
			sql += "(select bt.bt_name from books_type bt where bt.bt_num = bi.bi_type)bi_type from books_info bi ";
			if (search != null) {
				sql += " where ";
				if ("bi_title".equals(search)) 
				{
					sql += "bi_title like ?";
				}
				else if ("bi_type".equals(search)) 
				{
					sql += "bi_type like ?";
				} 
				else if ("bi_star".equals(search)) 
				{
					sql += "bi_star like ?";
				} 
				else if ("bi_credat".equals(search)) 
				{
					sql += "bi_credat like ?";
				} 
				else if ("bi_desc".equals(search)) 
				{
					sql += "bi_desc like ?";
				} 
				else if ("bi_credat,bi_type".equals(search)) 
				{
					sql += "bi_credat like ? or bi_type like?";
				} 
				else if ("bi_credat,bi_type,bi_desc".equals(search)) 
				{
					sql += "bi_credat like ? or bi_type like? or bi_desc like?";
				} 
				else 
				{
					sql += "";
				}
			}
			sql += "order by bi_num desc";
			PreparedStatement ps = con.prepareStatement(sql);
			if (search != null) 
			{
				if ("bi_title".equals(search) || "bi_type".equals(search) || "bi_star".equals(search)
						|| "bi_credat".equals(search) || "bi_desc".equals(search)) 
				{
					ps.setString(1, "%" + serStr + "%");
				} 
				else if ("bi_credat,bi_type".equals(search)) 
				{
					ps.setString(1, "%" + serStr + "%");
					ps.setString(2, "%" + serStr + "%");
				} 
				else if ("bi_credat,bi_type,bi_desc".equals(search)) 
				{
					ps.setString(1, "%" + serStr + "%");
					ps.setString(2, "%" + serStr + "%");
					ps.setString(3, "%" + serStr + "%");
				}
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
		%>
		<tr>
			<td><%=rs.getString("bi_num")%></td>
			<td><img width="50" height="50"
				src="<%=rootPath + rs.getString("bi_image")%>"></td>
			<td><%=rs.getString("bi_title")%></td>
			<td><%=rs.getString("bi_type")%></td>
			<td><%=rs.getString("bi_star")%></td>
			<td><%=rs.getString("bi_credat")%></td>
			<td><%=rs.getString("bi_desc")%></td>
			<td><a
				href="<%=rootPath%>/books/update.jsp?bi_num=<%=rs.getString("bi_num")%>"><button>수정</button></a></td>
			<td><a
				href="<%=rootPath%>/books/delete.jsp?bi_num=<%=rs.getString("bi_num")%>"><button>삭제</button></a></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="8">
				<form>
					<select name="search">
						<option value="bi_title">제목</option>
						<option value="bi_type">타입</option>
						<option value="bi_star">평점</option>
						<option value="bi_desc">설명</option>
						<option value="bi_credat">출판날짜</option>
						<option value="bi_credat,bi_type">제목,타입</option>
						<option value="bi_credat,bi_type,bi_desc">제목,타입,설명</option>
					</select> : <input type="text" name="serStr">
					<button>검색</button>
				</form>
			<td><a href="<%=rootPath%>/books/insert.jsp"><button>글작성</button></a>
			</td>
		</tr>
	</table>
</body>
</html>