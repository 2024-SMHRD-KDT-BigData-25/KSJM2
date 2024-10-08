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
        <img src="../img/potpot3.png" height="70px">
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
    <a href="#" id="img3" class="box">뭔 식물인지 모름 ㅎㅎ</a>
    <a href="#" id="img4" class="box">뭔 식물인지 모름 2</a>
    <a href="#" id="img5" class="box">뭔 식물인지 모름 3</a>
</div>

<div class="container">
   <a href="#" id="img6" class="box">박쥐란&nbsp;</a>
   <a href="#" id="img7" class="box">제두나 셀렘&nbsp;</a>
    <a href="#" id="img8" class="box">아리우카리아&nbsp;&nbsp;</a>
</div>
   
   
<footer>
   <div class="footerdiv" style="display: flex">
      <img class="logo2" src="../img/potpot4.png" align="left">

      <a class="text2" align="left">This home page is plant <br>second hand trading site</a>
   </div>
   <div class="footerdiv2" style="display: flex">
         <img class="instergram" src="../img/instergram.png">
         <img class="discord" src="../img/discod.png">
         <img class="twitter" src="../img/twitter.png">
   </div>
   
</footer>




</body>
</html>