<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>POTPOT</title>
	<link rel="stylesheet" href="../CSS/main.css">
</head>
<body>

	<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	
<header>


    <a class="logo" href="../jsp/main.jsp">
        <img src="../img/potpot3.png" height="36px">
      </a>
      <nav>
        <ul class="nav-items">
          <li><a href="salelist.jsp">식물마켓</a></li>
          <li><a href="#식물찾기">식물찾기</a></li>
          <li><a href="snslist.jsp">커뮤니티</a></li>
          <% if(member == null) { %>
          <li ><a href="../html/Join_Login.html"><img class="img" src="../img/join1.png" height="10px"></a></li>
          <% }else { %>
          <li ><a href="mypage.jsp"><img class="img" src="../img/join.png" height="10px"></a></li>
          <% } %>
        </ul>
        
          
      
      </nav>
</header>

                 

<div class="container">
    <div class="box1"><img class="img1" align="right" src="../img/center1.png"><h1 align="center" class="potpot1">POTPOT
		<h1 align="center"  class="text1">어쩌구저쩌</h1></h1></div>
</div>

<div class="container">
    <div class="box1"><img class="img2" align="left" src="../img/center1.png"><h1 align="center" class="potpot1">POTPOT
		<h1 align="center" class="text1">어쩌구저쩌</h1></h1></div>
</div>
	
<div class="container">
    <div class="box">박스 1</div>
    <div class="box">박스 2</div>
    <div class="box">박스 3</div>
</div>

	
	
	
<footer>
    &copy; 2024 나의 웹사이트. 모든 권리 보유.
</footer>



</body>
</html>