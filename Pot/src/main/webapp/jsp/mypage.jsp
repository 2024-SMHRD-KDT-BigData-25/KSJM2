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



	<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	
	<form action="Logout">
	
		<div class="container">
	        <div class="header">
	            <h1>My Page</h1>
	            <button class="edit-btn" onclick="">수정</button>
	            <input type="submit" class="edit-btn" value="로그아웃">
	        </div>
	        <div class="profile">
	            <h2 class="profile-name"><%=member.getUser_name() %></h2>
	        </div>
	
	        <div class="community-info">
	            <h3>커뮤니티 활동정보</h3>
	            <div class="info-box">
	                <div class="info-item">
	                    <p>작성한 글</p>
	                    <span>0</span>
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
	</form>
	
	
	<footer></footer>
</body>
</html>