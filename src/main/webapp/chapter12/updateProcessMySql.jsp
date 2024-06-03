<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%!
	Connection conn = null;
	DataSource ds = null;
	PreparedStatement pstmt = null;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = "", name = "", vclass = "", tel = "";
		
		id = request.getParameter("id");
		name = request.getParameter("name");
		vclass = request.getParameter("mclass");
		tel = request.getParameter("tel");
		
		try {
			//Context ctx = new InitialContext();
			//ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
			//conn = ds.getConnection();
			conn = ((DataSource) new InitialContext().lookup("java:comp/env/jdbc/mysql")).getConnection();
			
			StringBuffer updatequery = new StringBuffer();
			updatequery.append(" update member2 set name = ?, class = ?, tel = ? ");
			updatequery.append(" where id = ? ");
			
			pstmt = conn.prepareStatement(updatequery.toString());
			// ? 4개 순서대로
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.parseInt(vclass));
			pstmt.setString(3, tel);
			pstmt.setString(4, id);
			
			int re = pstmt.executeUpdate(); //정상적으로 수정시 1이 반환됨
			if(re == 1) {
		%>
				<%=id %>의 정보가 수정되었습니다.<br>
				[ <a href="viewMemberMysql.jsp">목록보기</a> ]
		<%
			} else {
		%>
				변경 실패
		<%
			}
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();	
		} finally {
			try{
				if(pstmt != null) { pstmt.close(); }	
				if(conn != null) { conn.close(); }	
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	%>
</body>
</html>