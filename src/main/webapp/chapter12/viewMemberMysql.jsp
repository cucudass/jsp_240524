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
	
	String url = "jdbc:mysql://localhost:3306/atom";
	String user = "bts"; //DB id
	String password = "1234"; //DB pw
	
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
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
				//createStatement() : 쿼리 이용하는 Statement 객체 생성
				stmt = conn.createStatement();
				//executeQuery() select문 쿼리에서 사용
				rs = stmt.executeQuery(sql);
				
				//next() 쿼리 결과가 있으면 참
				while(rs.next()){
		%>
		<tr>
			<td><!-- 아이디를 가지고 가서 조회 -->
				<!-- 여러개일떄 ?id= &name= &tel= -->
				<a href="updateMemberMySql.jsp?id=<%=rs.getString("id")%>"> <!-- 클릭하는 시점 -->
					<%=rs.getString("id") %>
				</a>
			</td>
			<td><%=rs.getString("name") %></td>
			<td>
				<%
					//getInt() : 숫자타입의 컬럼 값을 받을때 사용
					int n_class = rs.getInt("class");
					if(n_class == 1)
						out.print("일반회원");
					else
						out.print("교수님");
				%>
			</td>
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