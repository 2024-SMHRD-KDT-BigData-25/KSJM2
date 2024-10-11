<%@page import="com.smhrd.model.PotSale"%>
<%@page import="com.smhrd.model.SaleDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fade Image Slider without Container</title>

    <link rel="stylesheet" href="../CSS/main.css">
	<link rel="stylesheet" href="../CSS/market_detail2.css">
</head>
<body>

    <%
    int sale_idx = Integer.parseInt(request.getParameter("sale_idx"));
    SaleDAO dao = new SaleDAO();
    
    // 조회수
    int view = dao.views(sale_idx);
    
    // 게시물 정보
    PotSale board = dao.getBoard(sale_idx);
    
    // sale_img가 null인 경우를 체크
    String[] imgFiles = null;
    if (board.getSale_img() != null && !board.getSale_img().isEmpty()) {
        imgFiles = board.getSale_img().split(",");
    } else {
        imgFiles = new String[0]; // 빈 배열로 초기화
    }
    %>

    <!-- 이미지 슬라이더 -->
    <div class="slider-container">
                 <% 
                // 여러 개의 이미지 파일을 반복해서 출력
                for(int i = 0; i < imgFiles.length; i++) {
                    if(i == 0) { 
                %>
                    <div class="slide active">
                           <img src="../upload/<%=imgFiles[i]%>" alt="Image <%=i%>">
                    </div>

               
                <% 
                    } else { %>

                    <div class="slide">
                       <img src="../upload/<%=imgFiles[i]%>" alt="Image <%=i%>">
                    </div>
<%
 }
                }
                %>
        <!-- '이전' 버튼 -->
        <a class="prev" onclick="changeSlide(-1)">❮</a>
        <!-- '다음' 버튼 -->
        <a class="next" onclick="changeSlide(1)">❯</a>
    </div>

    <!-- 오른쪽 공간 (추가 콘텐츠가 들어가는 영역) -->
    <div class="right-space">
    
       <div class="product-meta-data" style="flex: 2;">
        <div class="line"></div>
        <a href="product-details.html">
          <h6><%=board.getSale_title() %></h6>
        </a>
        <p class="product-price"><%=board.getSale_price() %></p>
        <p class="market_user_id"><%=board.getUser_nick() %></p>
        <p class="market_date"><%=board.getCreated_at()%></p>
        
        <div class="short_overview my-5">
          <p><%=board.getSale_content() %></p>
        </div>
      </div>
        
    </div>

<script>
    /* 현재 활성화된 슬라이드의 인덱스를 저장 */
    let currentSlide = 0;

    /* 모든 슬라이드를 배열로 가져옴 */
    const slides = document.querySelectorAll('.slide');

    /* 주어진 인덱스의 슬라이드를 보여주는 함수 */
    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove('active'); /* 모든 슬라이드의 'active' 클래스를 제거 */
            if (i === index) {
                slide.classList.add('active'); /* 현재 인덱스의 슬라이드에 'active' 클래스 추가 */
            }
        });
    }

    /* 슬라이드를 변경하는 함수 (이전/다음 버튼 클릭 시 호출) */
    function changeSlide(direction) {
        /* 방향에 따라 현재 슬라이드 인덱스를 변경 */
        currentSlide = (currentSlide + direction + slides.length) % slides.length;
        /* 변경된 슬라이드 보여주기 */
        showSlide(currentSlide);
    }
</script>

</body>
</html>
