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
            background-color: #BFEBB0; /* 헤더 배경색 설정 */
            box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05), 0 1px 0 rgba(0, 0, 0, 0.05); /* 그림자 효과 */
        }

        #wrap {
            padding-top: 60px; /* header 높이만큼 패딩 추가하여 아래 콘텐츠가 header 아래로 떨어지게 함 */
        }

        /* Flexbox 스타일 추가 */
        .card-container {
            display: flex; /* Flexbox 사용 */
            flex-wrap: wrap; /* 아이템이 넘칠 경우 다음 줄로 이동 */
            gap: 20px; /* 카드 간 간격 */
            margin: 0 20px; /* 양쪽 여백 추가 */
            padding: 0 150px; /* 안쪽 여백을 150px로 설정 */
            margin-top: 50px; /* 상단 여백을 50px로 설정 */
        }
        
        .card {
            padding: 10px; /* 카드 안쪽 여백 */
            width: calc(16.66% - 20px); /* 한 줄에 6개 출력, 여백을 고려한 너비 */
            text-align: center; /* 텍스트 중앙 정렬 */
            box-sizing: border-box; /* 패딩과 경계를 포함한 전체 너비 계산 */
            margin-bottom: 20px; /* 카드 간의 아래쪽 여백을 줄임 */
        }

        .card img {
            width: 100%; /* 이미지 너비를 카드에 맞춤 */
            height: 150px; /* 고정 높이 설정 */
            object-fit: cover; /* 이미지 비율 유지하며 공간에 맞춤 */
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
    </style>

    <title>POP: 식물마켓</title>
</head>
<body>
<div id="wrap">
    <header>
        <a class="logo" href="../html/main.html">
            <img src="../img/potpot3.png" height="36px">
        </a>
        <nav>
            <ul class="nav-items">
                <li><a href="../jsp/salelist.jsp">식물마켓</a></li>
                <li><a href="#식물찾기">식물찾기</a></li>
                <li><a href="#커뮤티니">커뮤니티</a></li>
                <li ><a href="Join_Login.html"><img class="img" src="../img/join1.png" height="10px"></a></li>
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
    int pageSize = 36; // 게시물 수를 36으로 변경
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

<div>
    <button class="btn btn-sm btn-success" onclick="location.href='sale_write.jsp'">글작성</button>
    <button class="btn btn-sm btn-warning" onclick="window.open('', '채팅방', 'width=500, height=700, top=50, left=500')">채팅하기</button>
</div>



</body>
</html>
