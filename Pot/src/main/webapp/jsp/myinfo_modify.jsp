<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POTPOT: 회원 정보 수정</title>

    <script type="text/javascript" src="../member.js"></script>
    
    
</head>
<body>
	<form action="">
	
		<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	
		<h2>내 정보 수정</h2>
		
		아이디: <%= member.getUser_id() %><br>
		패스워드: <input type="password" name="user_pw"><br>
		이름: <%= member.getUser_name() %><br>
		닉네임: <input type="text" name="user_nick" value=<%= member.getUser_nick() %>><br>
		우편번호: <input type="text" name="user_post" value=<%= member.getUser_post() %>>
		<input id="findpost" type="button" style="width: 100px;" onclick="find_Postcode()" value="우편번호 찾기"></div><br>
		주소: <input type="text" name="user_addr1" value=<%= member.getUser_addr1() %>><br>
		상세주소: <input type="text" name="user_addr2" value=<%= member.getUser_addr2() %>><br>
		
		<input type="submit" value="수정" onclick="myinfoCheck()">
		<input type="button" value="취소" onclick="history.back()">
	</form>



</body>
</html>