<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

* {

      box-sizing: border-box;
    }
    
    
    body {
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;

    }
    
    
    li {
      list-style: none;
      
    }
    
    
    a {
      text-decoration: none;
    }
    
    
    header {
     position: fixed;
     width: 100%;
     height: 60px;
     z-index: 2000;
     background-color: white;
   }
   
   
   nav {
       float: right;
      
   }
   
   
   .logo {
     display: inline-block;
     height: 50px;
     margin: 12px 0 12px 25px;
   }
   
   
   .logo > img { height: 70px; }
   
   
   .nav-items > li {
        display: inline-block;
   }      
   
                     
   .nav-items > li > a {
     line-height: 40px;
     padding: 0 10px;
     color: #01D281; 
   }
   .nav-items > li > a:hover {
     color: rgba(0, 0, 0, 0.8);
   }
   
   .img {
   display: inline-block;
   line-height: 60px;
     padding: 0 20px;
     padding-top: 20px;
        height: 1.2cm;
        width: 1.8cm;
}


</style>
</head>
<body>
<header>

<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
    <a class="logo" href="../jsp/main.jsp">
        <img src="../img/potpot3.png" height="70px">
      </a>
      <nav>
        <ul class="nav-items">
          <li><a href="salelist.jsp">식물마켓</a></li>
          <li><a href="search.jsp">식물찾기</a></li>
          <li><a href="snslist.jsp">커뮤니티</a></li>
          <% if(member == null) { %>
          <li ><a href="../html/Join_Login.html"><img class="img" src="../img/join1.png" height="10px"></a></li>
          <% }else { %>
          <li ><a href="mypage.jsp"><img class="img" src="../img/join.png" height="10px"></a></li>
          <% } %>
        </ul>
        
          
      
      </nav>
</header>
</body>
</html>