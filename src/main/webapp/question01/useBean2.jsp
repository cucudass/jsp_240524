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
		int num = 5;
		for(int i=1; i<=9; i++) {
			
	%>
			num * <%=i %> = <%=gugudan.process(num, i) %><br>
	<%
		}
	%>
</body>
</html>