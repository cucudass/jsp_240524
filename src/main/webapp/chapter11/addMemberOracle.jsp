<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%!
	Connection conn = null;
	//쿼리문을 이용을 위한 인터페이스
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott"; //DB id
	String password = "tiger"; //DB pw
	
	//String sql = " insert into member2 values ()";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = "", pw = "", name = "", sclass = "", p1 = "", p2 = "", p3 = "";
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		sclass = request.getParameter("mclass");
		p1 = request.getParameter("phone1");
		p2 = request.getParameter("phone2");
		p3 = request.getParameter("phone3");
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Oracle 기준
			//getConnection 메소드로 DB 연결
			conn = DriverManager.getConnection(url, user, password);
			String sql = "insert into member2 values (?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, sclass);
			pstmt.setString(5, p1+"-"+p2+"-"+p3);
			
			//executeUpdate insert 할 때 사용됨
			int re = pstmt.executeUpdate();
			if(re == 1) {
		%>
				추가 성공
				<br>
				<a href="addFormOracle.html">추가작업</a>
				<a href="viewMemberOracle.jsp">조회작업</a>
		<%
			} else {
		%>
				<font color="red">추가 실패...</font>
		<%
			}
		} catch(SQLException ex) {
			out.print("데이터베이스 연결이 실패했습니다.");
			out.print(ex.getMessage()); //기본 오류 메시지
		} finally {
			try{
				if(stmt != null) { stmt.close(); }	
				if(conn != null) { conn.close(); }	
			} catch (SQLException se) {
				se.printStackTrace();
			}
			
		}
	%>
</body>
</html>