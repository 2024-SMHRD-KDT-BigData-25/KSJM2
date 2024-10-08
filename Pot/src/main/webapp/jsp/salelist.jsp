<%@page import="com.smhrd.model.PotUsers"%>
<%@page import="com.smhrd.model.PotSale"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.SaleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/main.css">
    <link rel="stylesheet" href="../CSS/market_list.css">
	<title>식물마켓 | POTPOT</title>
	
</head>

<body>

	<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	
	
<div id="wrap">
    <header>
            <a class="logo" href="../jsp/main.jsp">
        <img src="../img/potpot3.png" height="36px">
      </a>
      <nav>
        <ul class="nav-items">
          <li><a href="salelist.jsp">식물마켓</a></li>
          <li><a href="#식물찾기">식물찾기</a></li>
          <li><a href="#커뮤티니">커뮤니티</a></li>
          <% if(member == null) { %>
          <li ><a href="../html/Join_Login.html"><img class="img" src="../img/join1.png" height="10px"></a></li>
          <% }else { %>
          <li ><a href="mypage.jsp"><img class="img" src="../img/join.png" height="10px"></a></li>
          <% } %>
        </ul>
        </nav>
    </header>
</div>

<%
    // DAO -> 전체 게시물 정보를 가져오는 기능
    SaleDAO dao = new SaleDAO();
    List<PotSale> list = dao.getList();
    System.out.println(list.size());

    // 페이지당 게시물 수
    int pageSize = 24; // 게시물 수를 24로 변경
    // 현재 페이지 번호
    int currentPage = 1; // 기본적으로 첫 페이지
    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }

    // 시작 인덱스 계산
    int startIndex = (currentPage - 1) * pageSize;
    int endIndex = Math.min(startIndex + pageSize, list.size());

    // 현재 페이지에 해당하는 게시물 리스트 생성
    List<PotSale> pagedList = new ArrayList<>(list.subList(startIndex, endIndex));
    int totalPages = (int) Math.ceil((double) list.size() / pageSize); // 총 페이지 수
%>



<div class="card-container">
    <% for (PotSale m : pagedList) { %>
        <div class="card">
	            <a href="salecontent.jsp?sale_idx=<%= m.getSale_idx() %>">
	                <% String[] parts = m.getSale_img().split(","); %>
	                	<img src="../upload/<%= parts[0] %>" alt="<%= m.getSale_title() %>">
	            </a>
	            
	            <h4><%= m.getSale_title() %></h4>
	            
	            <!-- ID와 Price를 한 줄에 나란히 표시 -->
	            <div class="id-price">
	                <span class="saleUserId"><%= m.getUser_id() %></span>
	                <span class="productPrice"><%= m.getSale_price() %></span>
	            </div>
	            
	            <p><%= m.getCreated_at() %></p>
	            <p><%= m.getSale_views() %></p>
        </div>
    <% } %>
</div>

<!-- 페이지 넘기는 버튼 -->
<div class="pagination">
    <% for (int i = 1; i <= totalPages; i++) { %>
        <button onclick="location.href='salelist.jsp?page=<%= i %>'" <%= (i == currentPage) ? "disabled" : "" %> >
            <%= i %>
        </button>
    <% } %>
</div>


<!-- 버튼 컨테이너 추가 -->
<% if(member == null) { %>
<% }else { %>
<div class="button-container">
    <button class="btn btn-success" onclick="location.href='sale_write.jsp'">글 작성</button>
</div>
<% } %>

</body>
</html>
