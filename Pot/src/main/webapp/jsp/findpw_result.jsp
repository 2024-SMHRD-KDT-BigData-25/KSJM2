<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POT: 비밀번호 찾기</title>

<script type="text/javascript" src="../member.js"></script>
<link rel="stylesheet" href="../CSS/findid_result.css"/>
</head>
<body>

		<% 
			PotUsers member = (PotUsers)session.getAttribute("member");
		%>
		
		<% if(member == null) { %>
			<h3>일치하는 정보가 없습니다.</h3>
			<div class="center"><input id="backbtn" type="button" value="돌아가기" onclick="window.history.back()"></div>
		<% }else { %>
			<h3>비밀번호는 
			<span><%= member.getUser_pw() %></span> 입니다.</h3>
	<form action="sessiondel" method="post">
			<div class="center"><input id="go2loginbtn" type="submit" value="로그인 하러 가기"></div>
		<% } %>
	</form>
	
</body>
</html>