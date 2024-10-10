<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정 | POTPOT</title>
    
    <link rel="stylesheet" href="../CSS/main.css">
    <link rel="stylesheet" href="../CSS/mypage_edit.css">
    
    <script type="text/javascript" src="../member.js"></script>
    
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
<br><br><br><br>

    <div class="container">
        <div class="header">
            <h1>회원 정보 수정</h1>
           
        </div>
        
        <form class="info-form" action="UpdateMemberServlet" method="post"> <!-- Assuming UpdateMemberServlet processes the update -->
            <%
                PotUsers member = (PotUsers)session.getAttribute("member");
            %>

            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="user_id" value="<%= member.getUser_id() %>" readonly> <!-- Read-only since ID cannot be changed -->
            </div>
            
            <div class="form-group">
                <label for="password">패스워드</label>
                <input type="password" id="password" name="user_pw">
            </div>

            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="user_name" value="<%= member.getUser_name() %>" readonly> <!-- Read-only since name usually doesn't change -->
            </div>
            
            <div class="form-group">
                <label for="nick">닉네임</label>
                <input type="text" id="nick" name="user_nick" value="<%= member.getUser_nick() %>">
            </div>

            <div class="form-group zip-group">
                <label for="zip">우편번호</label>
                <div class="zip-container">
                    <input type="text" id="zip" name="user_post" value="<%= member.getUser_post() %>">
                    <button type="button" class="zip-search" onclick="find_Postcode()">검색하기</button>
                </div>
            </div>
            
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="user_addr1" value="<%= member.getUser_addr1() %>">
            </div>

            <div class="form-group">
                <input type="text" id="detail-address" name="user_addr2" value="<%= member.getUser_addr2() %>" placeholder="상세 주소 입력">
            </div>

           
            <button type="submit" class="save-btn" onclick="myinfoCheck()">변경사항 저장하기</button>
            <button type="button" class="cancel-btn" onclick="history.back()">취소</button>
        </form>
    </div>
    
    <br><br><br><br><br><br><br>
   <footer></footer>
</body>
</html>
