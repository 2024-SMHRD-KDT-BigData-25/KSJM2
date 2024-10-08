<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>POTPOT</title>
   <link rel="stylesheet" href="../CSS/main.css">
   <script>
    // header, footer 동적으로 삽입
    document.addEventListener('DOMContentLoaded', function() {
      fetch('header.jsp')
        .then(response => response.text())
        .then(data => {
          document.querySelector('header').innerHTML = data;
        });
      
      fetch('footer.jsp')
        .then(response => response.text())
        .then(data => {
          document.querySelector('footer').innerHTML = data;
        });
    });
  </script>
</head>
<body>


<header></header>   

                 

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
   
   
<footer></footer>
</body>
</html>