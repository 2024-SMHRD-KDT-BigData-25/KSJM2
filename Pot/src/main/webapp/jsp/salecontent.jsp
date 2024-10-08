<%@page import="com.smhrd.model.PotSale"%>
<%@page import="com.smhrd.model.SaleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <!-- Title  -->
<title>식물마켓 Details | POTPOT</title>


<link rel="stylesheet" href="../CSS/market_content.css">

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


<!-- Core Style CSS -->

<link rel="stylesheet" href="../CSS/market_content.css">



</head>

<body>
  <%
  int sale_idx = Integer.parseInt(request.getParameter("sale_idx"));
  SaleDAO dao = new SaleDAO();
  PotSale board = dao.getBoard(sale_idx);
  
  String[] imgFiles = null;
  if (board.getSale_img() != null && !board.getSale_img().isEmpty()) {
      imgFiles = board.getSale_img().split(",");
  } else {
      imgFiles = new String[0];
  }
  %>

  <header></header>

  <br><br><br><br><br><br><br><br><br><br>

    <!-- 사진과 글을 감싸는 div -->
    <div class="product-details" style="display: flex; align-items: flex-start;">
      <!-- 사진 슬라이드 -->
      <div class="product-images" style="flex: 1; padding-right: 20px;">
        <% 
        for(String img : imgFiles) {
            if(img != null && !img.trim().isEmpty()) { 
        %>
            <img src="../upload/<%=img.trim()%>" style="max-width:200px; margin-right:10px;">
        <% 
            } 
        }
        %>
      </div>

      <!-- 제품 상세글 -->
      <div class="product-meta-data" style="flex: 2;">
        <div class="line"></div>
        <a href="product-details.html">
          <h6><%=board.getSale_title() %></h6>
        </a>
        <p class="product-price"><%=board.getSale_price() %></p>
        <p class="market_user_id"><%=board.getUser_id() %></p>
        <p class="market_date"><%=board.getCreated_at()%></p>
        
        <div class="short_overview my-5">
          <p><%=board.getSale_content() %></p>
        </div>
      </div>
    </div>

    <!-- 채팅하기 버튼 -->
    <form class="market_chat" method="post">
      <button type="submit" name="market_chat" class="chat-btn">판매자와 채팅하기</button>
    </form>

    <div style="text-align: center; margin-top: 20px;">
      <button class="btn btn-sm btn-info">수정</button>
      <button class="btn btn-sm btn-warning">삭제</button>
      <button class="btn btn-sm btn-success">리스트</button>    			
    </div>
  </div>

  <script src="js/jquery/jquery-2.2.4.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/plugins.js"></script>
  <script src="js/active.js"></script>


<br><br><br><br><br><br><br><br><br><br>
  <footer></footer>
</body>

</html>