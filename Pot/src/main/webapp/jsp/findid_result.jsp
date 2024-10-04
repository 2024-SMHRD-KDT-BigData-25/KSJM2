<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POT: 아이디 찾기</title>

<script type="text/javascript" src="member.js"></script>


</head>
<body>


	
		<% 
			PotUsers member = (PotUsers)session.getAttribute("member");
		%>
		
		<% if(member == null) { %>
			일치하는 정보가 없습니다.
			<input type="button" value="돌아가기" onclick="window.history.back()">
		<% }else { %>
			ID는 <%= member.getUser_id() %> 입니다.
	<form action="sessiondel" method="post">
			<input type="submit" value="로그인 하러 가기">
		<% } %>
	</form>

</body>
</html>