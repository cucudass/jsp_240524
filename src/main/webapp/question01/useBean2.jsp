<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.GuGuDan" id="gugudan"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>구구단 출력하기</h4>
	<%
		for(int i=1; i<=9; i++) {
			
	%>
			5 * <%=i %> = <%=gugudan.process(i) %><br>
	<%
		}
	%>
</body>
</html>