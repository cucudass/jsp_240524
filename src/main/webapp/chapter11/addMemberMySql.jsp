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
	String url = "jdbc:mysql://localhost:3306/atom";
	String user = "bts"; //DB id
	String password = "1234"; //DB pw
	
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
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			//insert 쿼리 생성
			StringBuffer insertQuery = new StringBuffer();
			insertQuery.append("insert into member2 values ('");
			insertQuery.append(id + "','");
			insertQuery.append(pw + "','");
			insertQuery.append(name + "',");
			insertQuery.append(sclass + ",'");
			insertQuery.append(p1+"-"+p2+"-"+p3+"')");
			
			out.print(insertQuery.toString());
			//executeUpdate insert 할 때 사용됨
			int re = stmt.executeUpdate(insertQuery.toString());
			if(re == 1) {
		%>
				추가 성공
				<br>
				<a href="addFormMySql.html">추가작업</a>
				<a href="viewMemberMysql.jsp">조회작업</a>
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