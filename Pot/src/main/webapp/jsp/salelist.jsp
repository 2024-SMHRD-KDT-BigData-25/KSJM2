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
  
    <style>
        /* 페이지 배경색 설정 */
        body {
            background-color: white; /* 배경색을 흰색으로 설정 */
            margin: 0; /* 기본 마진 제거 */
            padding: 0; /* 기본 패딩 제거 */
        }

        header {
            position: fixed; /* 헤더를 고정 위치로 설정 */
            top: 0; /* 상단에 위치하게 설정 */
            left: 0; /* 왼쪽에 위치하게 설정 */
            width: 100%; /* 전체 너비를 사용 */
            height: 60px; /* 헤더 높이 설정 */
            z-index: 2000; /* 다른 콘텐츠보다 위에 보이도록 설정 */
            background-color: rgba(0, 0, 0, 00); /* 헤더 배경색 설정 */
        }

        #wrap {
            padding-top: 60px; /* header 높이만큼 패딩 추가하여 아래 콘텐츠가 header 아래로 떨어지게 함 */
        }

        /* Flexbox 스타일 추가 */
        .card-container {
            display: flex; /* Flexbox 사용 */
            flex-wrap: wrap; /* 아이템이 넘칠 경우 다음 줄로 이동 */
            gap: 20px; /* 카드 간 간격 */
            justify-content: center; /* 카드들을 가운데 정렬 */
            padding: 0 100px; /* 좌우 패딩을 100px로 설정하여 여백 증가 */
            margin-top: 50px; /* 상단 여백을 50px로 설정 */
        }
        
        .card {
            padding: 10px; /* 카드 안쪽 여백 */
            width: calc(25% - 20px); /* 한 줄에 4개 출력, 여백을 고려한 너비 */
            text-align: center; /* 텍스트 중앙 정렬 */
            box-sizing: border-box; /* 패딩과 경계를 포함한 전체 너비 계산 */
            margin-bottom: 20px; /* 카드 간의 아래쪽 여백을 줄임 */
            min-height: 400px; /* 게시물 최소 높이 설정 */
            background-color: transparent; /* 배경색 제거 */
            border: none; /* 테두리 제거 */
        }

        .card img {
            width: 100%; /* 이미지 너비를 카드에 맞춤 */
            height: 300px; /* 이미지 고정 높이 설정 */
            object-fit: cover; /* 이미지 비율 유지하며 공간에 맞춤 */
        }

        .card h4 {
            padding: 10px 0; /* 위아래 여백을 10px로 설정하여 타이틀 높이 감소 */
            margin: 0; /* 기본 여백 제거 */
        }

        .id-price {
            border-top: 1px solid black; /* 제목과 가격 사이에 구분선 추가 */
            padding: 5px 0; /* 여백 추가 */
        }

        .pagination {
            display: flex;
            justify-content: center; /* 가운데 정렬 */
            margin-top: 20px; /* 페이지네이션 위쪽 여백 */
        }

        .pagination button {
            margin: 0 5px; /* 버튼 간 간격 */
            padding: 5px 10px; /* 버튼 안쪽 여백 */
        }

        .button-container {
            display: flex; 
            justify-content: flex-end; /* 오른쪽 정렬 */
            gap: 10px; /* 버튼 간격 */
            margin: 20px 0px; /* 상단 여백 및 좌우 여백 설정 */
            position: fixed; /* 고정 위치 */
            right: 30px; /* 오른쪽 여백 */
            bottom: 30px; /* 아래쪽 여백 */
            z-index: 1000; /* 다른 요소보다 위에 표시 */
        }

        .btn {
            padding: 10px 15px; /* 버튼 안쪽 여백 */
            border-radius: 5px; /* 모서리 둥글게 */
            border: none; /* 테두리 제거 */
            color: white; /* 글자 색상 */
            cursor: pointer; /* 포인터 커서 */
        }

        .btn-success {
            background-color: #28a745; /* 글 작성 버튼 색상 */
        }

        .btn-warning {
            background-color: #ffc107; /* 채팅하기 버튼 색상 */
        }

        .btn-success:hover {
            background-color: #218838; /* 글 작성 버튼 호버 색상 */
        }

        .btn-warning:hover {
            background-color: #d39e00; /* 채팅하기 버튼 호버 색상 */
        }

    </style>

    <title>POP: 식물마켓</title>
</head>
<body>

	<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	
	
<div id="wrap">
    <header>
            <a class="logo" href="../jsp/main.jsp">
        <img src="../img/potpot3.png" height="50px">
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
                <span><%= m.getUser_id() %></span>
                <span><%= m.getSale_price() %></span>
            </div>
            
            <p><%= m.getCreated_at() %></p>
            <p><%= m.getSale_views() %></p>
        </div>
    <% } %>
</div>

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
