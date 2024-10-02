<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		
	<form action="FindId" method="post" name="frm">

		<input type="text" name="user_name" placeholder="이름">
		<input type="text" name="user_phone" placeholder="연락처">
		<input type="submit" value="찾기">
		<input type="button" value="취소" onclick="window.close()">
		
	</form>
	


</body>
</html>