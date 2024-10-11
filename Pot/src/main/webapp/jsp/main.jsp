<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>POTPOT</title>
   <link rel="stylesheet" href="../CSS/main.css">
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    
    
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
  
      <link rel="stylesheet" href="../CSS/chatstyle.css">
      
      
</head>
<body>


<header></header>

<%
    PotUsers member = (PotUsers) session.getAttribute("member");
	
    String membernick = member != null ? member.getUser_nick(): "";
%>
                 

<div class="container">
    <div class="box1">
    	<img class="img1" align="right" src="../img/center1.png">
	    <h1 align="center" class="potpot1">이웃과 가까이,  반려식물은 
	    			<p>더 가까이</p>
	    		<br>동네에서 이웃과 함께하는<br><br></h1>
	    	
	      		<h1 align="center" class="text1"> 반려식물 라이프, POTPOT</h1>
	      		
	     
    
     </div>
</div>

<div class="container">
    <div class="box1"><img class="img2" align="left" src="../img/center2.png">
    <h1 align="center" class="potpot1">빠르고 쉽게 가까운 우리동네에서 <br> 내가 당장 사고싶은 <p>식물을 중고로 거래</p>할 수 있어요</h1>
    <br>
    <h1 align="center" class="potpot2">식집사들만의 <a href="../jsp/snslist.jsp">식물 노하우 커뮤니티</a>와 <br> <a>실시간 채팅</a>을 지금 사용해 보세요!</h1>

</div>
</div>

<div class="market_list">
	<h1>POTPOT Market</h1>
</div>

<div class="container">
    <a href="#" id="img3" class="box">호야 안젤리나 : 앵글리아나</a>
    <a href="#" id="img4" class="box">피쉬본 선인장</a>
    <a href="#" id="img5" class="box">프랭키 보이 측백나무</a>
</div>

<div class="container">
   <a href="#" id="img6" class="box">박쥐란&nbsp;</a>
   <a href="#" id="img7" class="box">준쿠스 스프링골플&nbsp;</a>
    <a href="#" id="img8" class="box">아리우카리아&nbsp;&nbsp;</a>
</div>
   
   
       <!-- 채팅 -->
    
	<div id="chat-container">
		<div id="chat-header" onclick="toggleChat()">채팅</div>
	    
		<div id="chat-box">
			<div id="msgArea"></div>
			<div id="chat-footer">
				<input type="text" id="msg" placeholder="메시지를 입력하세요">
				<%if(member != null) {%>
				<button id="send-btn" onclick="send()"><img class="push" src="../img/종이비행기.png"></button>
				<%}else{ %>
				<button id="send-btn" onclick="window.location.href='../html/Join_Login.html'"><img class="push" src="../img/종이비행기.png"></button>
				<%} %>
			</div>
		</div>
	</div>
  
    



<script>
    var membernick = "<%= membernick %>";
</script>

<script src="../chatscript.js"></script>


   
<footer></footer>
</body>
</html>