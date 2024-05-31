<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Asterisk" id="asterisk"></jsp:useBean>
<jsp:setProperty property="num" name="asterisk"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>입력된 정수가 <%=asterisk.getNum() %>는</h4>
	<p>
		<%
			out.print(asterisk.process2());
		%>
	</p>
	
	<hr>
	<p>
		<%
			for(int i = asterisk.getNum(); i > 0; i--) {
		%>
			<%=asterisk.process(i) %><br>
		<%
			}
		%>
	</p>
</body>
</html>