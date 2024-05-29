<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="magic.MemberBean" id="memBean"/>
<!-- property="id" : 넘오오는 name="id"를 받아주고, jsp:setProperty 일때 setter로 저장 -->
<!-- 넘어온 값 무시하고 value="azaz" 적용 -->
<%-- <jsp:setProperty value="azaz" property="id" name="memBean"/> --%>
<%-- <jsp:setProperty property="id" name="memBean"/> --%>
<%-- <jsp:setProperty property="name" name="memBean"/> --%>
<!-- property="*" 한번에 매핑 적용하려면 넘어오는 name과 빈에 프로퍼티가 동일해야 함 -->
<jsp:setProperty property="*" name="memBean"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	당신이 입력한 정보입니다.
	<hr>
	아 이 디 : <jsp:getProperty property="id" name="memBean"/><br><!-- getter로 동작 -->
	이름 : <jsp:getProperty property="name" name="memBean"/><br><!-- getter로 동작 -->
	회원구분 : <%=memBean.getMclass() == 1 ? "일반회원":"교수님"%><br>
	전화번호 : <jsp:getProperty property="phone1" name="memBean"/>-
			 <jsp:getProperty property="phone2" name="memBean"/>-
			 <jsp:getProperty property="phone3" name="memBean"/>
</body>
</html>