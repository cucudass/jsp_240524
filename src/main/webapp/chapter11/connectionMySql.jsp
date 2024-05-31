<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//데이터베이스 연결을 위한 인터페이스
		Connection conn = null;
		//오류 대비 예외처리
		try {
			//연결 정보 => 자기 pc포트 3306, database -> atom
			String url = "jdbc:mysql://localhost:3306/atom";
			String user = "bts"; //DB id
			String password = "1234"; //DB pw
			//mysql 드라이버 로딩
			//Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver"); //mysql 기준
			//getConnection 메소드로 DB 연결
			conn = DriverManager.getConnection(url, user, password);
			
			out.print("데이터베이스 연결이 성공했습니다.");
		} catch (SQLException ex) {
			out.print("데이터베이스 연결이 실패했습니다.");
			out.print(ex.getMessage()); //기본 오류 메시지
		} finally {
			if(conn != null) { //conn 객체에 연결정보가 있으면 종료
				conn.close();
			}
		}
	%>
</body>
</html>