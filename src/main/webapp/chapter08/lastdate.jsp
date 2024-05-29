<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie lastDate = null;
	String msg = ""; //출력 메시지
	boolean found = false; //방문 여부
	String newValue = ""+System.currentTimeMillis(); //현재시간 
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		System.out.print("@# cookies.length => "+cookies.length);
		
		for(int i=0; i<cookies.length; i++) {
			lastDate = cookies[i];
			//첫 방문이 아닐 때
			if(lastDate.getName().equals("lastDateCookie")) {
				found = true;
				break;
			}
		}
		//lastDate 쿠기 객체를 만듬
		if(!found) { // 첫 방문
			msg = "처음 방문입니다...";
			lastDate = new Cookie("lastDateCookie", newValue);
			lastDate.setMaxAge(356*24*60*60);
			lastDate.setPath("/");
			
			response.addCookie(lastDate);
		} else {
			//lastDate 쿠기에 있는 시간정보 값을 long 변수로 저장
			long conv = Long.parseLong(lastDate.getValue());
// 			Date 객체로 의미있는 시간 정보를 출력
			msg="당신의 마지막 방문 :"+new Date(conv);
			// 다음 방문을 위한 값 설정
			lastDate.setValue(newValue);
			response.addCookie(lastDate);
		}
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=msg %></h2>
</body>
</html>