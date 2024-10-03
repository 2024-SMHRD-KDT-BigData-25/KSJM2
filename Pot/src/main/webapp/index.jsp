<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
<h2><%= "Hello World!" %></h2>


		<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	

				<% if(member == null) { %>
					<h2>로그인 실패</h2>
					<a href="sale_write.jsp">작성</a>
				<% }else { %>
					<h2>로그인 성공</h2>
					<a href="sale_write.jsp">작성</a>
					<%= member.getUser_id() %> 환영합니다.
				<% } %>
				
				
				
</body>
</html>
