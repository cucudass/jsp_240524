<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h2>[ 세션 값을 설정하는 예제]</h2>
	</center>
	<hr>얻어온 세션값은 다음과 같습니다.<hr><br>
	<%
		//session 내장 객체의 getAttribute 메소드는 세션이름으로 값을 가져옴
		Object obj_getdate = session.getAttribute("Testing");
		//String으로 다운 캐스팅
		String str_getdate = (String)obj_getdate;
		//auto_unboxing => Ojbject -> int
		int int_primitive = (Integer)session.getAttribute("MyData");
		
		out.print("설정된 세션값[1] => "+str_getdate+"<br><br>");
		out.print("설정된 세션값[2] => "+int_primitive+"<br><br>");
	%>
	<hr>
</body>
</html>