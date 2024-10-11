<%@page import="com.smhrd.model.PotSns"%>
<%@page import="com.smhrd.model.SnsDAO"%>
<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

    <link rel="stylesheet" href="../CSS/mypage.css">
    
    
    <script src="https://kit.fontawesome.com/eefb1e8780.js" crossorigin="anonymous"></script>


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
<br><br><br><br><br>


	<% PotUsers member = (PotUsers)session.getAttribute("member");
	
		SnsDAO dao = new SnsDAO();
		
		PotSns res = dao.count(member.getUser_id());
	
	%>
	
	<form action="Logout">
	
		<div class="container">
	        
	        <h1>My Page</h1>
	            
	        <div class="profile">
	         	<h2><%=member.getUser_nick() %></h2>
	        	<button class="edit-btn" type="button" onclick="location.href='myinfo_modify.jsp'">수정 &nbsp;</button>
	        	<button class="edit-btn" type="submit">로그아웃</button>       
	        </div>
	</form>
	
	        <div class="community-info">
	            <h3>커뮤니티 활동정보</h3>
	            <div class="info-box">
	                <div class="info-item">
	                    <p>작성한 글</p>
	                    <span><%=res.getUser_id() %></span>
	                </div>
	                <div class="info-item">
	                    <p>판매한 식물</p>
	                    <span>0</span>
	                </div>
	            </div>
	        </div>
	        
		
		
	        <div class="purchase-history">
	            <h3>구매 내역</h3>
	            <p><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp; 주문 내역 조회</p>
	        </div>
			
	        <div class="sale-history">
	            <h3>판매 내역</h3>
	            <p><i class="fa-solid fa-list-check"></i>&nbsp;&nbsp; 상품 등록</p>
	        </div>
	    </div>
	
	<br><br><br><br><br>
	<footer></footer>
</body>
</html>