<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn = null;
	DataSource ds = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			conn = ds.getConnection();
			StringBuffer selectQuery = new StringBuffer();
			
			String id = request.getParameter("id");
			
			selectQuery.append(" select name, class, tel ");
			selectQuery.append(" from member2 ");
			selectQuery.append(" where id = ? ");
			//prepareStatement() 객체 생성해서 쿼리 사용
			pstmt = conn.prepareStatement(selectQuery.toString());
			//쿼리 파라미터에 값 저장
			pstmt.setString(1, id);
			//executeQuery() 메소드로 쿼리 실행해서 결과값을 ResultSet 객체로 받음
			rs = pstmt.executeQuery();
			if(rs.next()) {
		%>
				<form method="post" action="updateProcessOracle.jsp">
					아이디 : <input type=text name="id" value="<%=id %>" readonly><br>
					이름 : <input type=text name="name" value="<%=rs.getString("name")%>"><br>
					회원등급 : <input type=text name="mclass" value="<%=rs.getInt("class")%>"><br>
					전화번호 : <input type=text name="tel" value="<%=rs.getString("tel")%>"><br>
					<input type="submit" value="수정">
					<a href="viewMemberOracle.jsp">목록보기</a>
				</form>
		<%
			} else {
		%>
				<font color="red">아이디 없음</font><br>
				<a href="viewMemberOracle.jsp">목록보기</a>
		<%
			}
		} catch(NamingException ne) {
			ne.printStackTrace();
		} catch(SQLException ex) {
			out.print("데이터베이스 연결이 실패했습니다.");
			ex.printStackTrace();
		} finally {
			try{
				if(rs != null) { rs.close(); }	
				if(pstmt != null) { pstmt.close(); }	
				if(conn != null) { conn.close(); }	
			} catch (SQLException se) {
				se.printStackTrace();
			}			
		}
		%>
</body>
</html>