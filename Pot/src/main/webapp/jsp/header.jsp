<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../CSS/main.css">
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