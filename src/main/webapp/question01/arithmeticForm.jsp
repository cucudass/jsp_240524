<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Arithmetic" id="arith"></jsp:useBean>
<jsp:setProperty property="*" name="arith"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>당신이 입력한 정보입니다.</h4>
	<%
		out.print(arith.process(arith.getNum1(),arith.getNum2(),arith.getAri()));
	%>
</body>
</html>