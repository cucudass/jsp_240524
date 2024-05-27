<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%= %> : 표현식으로 출력 ;추가하면 오류 --%>
	<p>
		Today's date:
		<%= new Date() %>
	</p>
</body>
</html>