<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn = null;
	//쿼리문을 이용을 위한 인터페이스
	Statement stmt = null;
	//쿼리의 결과를 받기 위한 인터페이스
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott"; //DB id
	String password = "tiger"; //DB pw
	
	String sql = " select id, pw, name, class, tel " +
				 " from member2 ";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="width: 400;">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>등급</td>
			<td>전화번호</td>
		</tr>
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver"); //Oracle 기준
				//getConnection 메소드로 DB 연결
				conn = DriverManager.getConnection(url, user, password);
				//createStatement() : 쿼리 이용하는 Statement 객체 생성
				stmt = conn.createStatement();
				//executeQuery() select문 쿼리에서 사용
				rs = stmt.executeQuery(sql);
				
				//next() 쿼리 결과가 있으면 참
				while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getInt("class") == 1?"일반회원":"교수님" %></td>
			<td><%=rs.getString("tel") %></td>
		</tr>	
		<%
				}
			} catch(SQLException ex) {
				out.print("데이터베이스 연결이 실패했습니다.");
				out.print(ex.getMessage()); //기본 오류 메시지
			} finally {
				try{
					if(rs != null) { rs.close(); }	
					if(stmt != null) { stmt.close(); }	
					if(conn != null) { conn.close(); }	
				} catch (SQLException se) {
					se.printStackTrace();
				}
				
			}
		%>
	</table>
</body>
</html>