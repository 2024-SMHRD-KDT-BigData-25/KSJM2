<%@page import="com.smhrd.model.PotUsers"%>
<%@page import="java.util.Optional"%>
<%@page import="com.smhrd.model.PotSale"%>
<%@page import="com.smhrd.model.SaleDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fade Image Slider without Container</title>

    <style>
    
    
		body {
		    font-family: Arial, sans-serif;
		    margin: 0;
		    padding: 0;
		    background-color: white;
		    display: flex;
		    flex-direction: column; /* 수직 방향으로 정렬 */
		    height: 100vh;
		}

		.content {
		    display: flex; /* 슬라이더와 오른쪽 콘텐츠를 나란히 배치 */
		    flex: 1; /* 남은 공간을 차지하도록 설정 */
		    padding-bottom: 5%; /* footer와의 간격을 위해 아래쪽 패딩 추가 */
		}


        .slider-container {
            position: relative;
            width: 30%;
            overflow: hidden;
            padding-bottom: 28%;
            height: 0;
            margin-top: 7%;
            margin-left: 15%;
            margin-right: 10%; /* 슬라이더와 오른쪽 콘텐츠 사이의 간격을 설정 */
        }

        .slide {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        .active {
            opacity: 1;
        }

        .slide img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .prev, .next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: transparent;
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 18px;
            border-radius: 5px;
            color: #01D281;
        }
        
        .prev:hover, .next:hover{
       		color: white;
        }

        .prev {
            left: 10px;
        }

        .next {
            right: 10px;
        }

        .right-space {
            width: 30%;
            margin-top: 7%;
            margin-right: 15%;
            padding: 20px;
            box-sizing: border-box;
            background-color: #fff;
        }
        
        .line {
    height: 2.5px;
    background-color: #01D281;
    width: 130px;
    margin-bottom: 20px;
}

.product-meta-data h2 {
      font-size: 30px;
      color: black;
      font-weight: 700;
      margin-bottom: 20px;
      
}

.product-meta-data p {
    font-size: 18px;
    margin: 5px 0;
}

.product-price {
   color: #01D281;
   font-size: 300px;
   font-weight: 900;
   margin-bottom: 10px;
   
}

.product_user_nick, .product_date{
	font-size: 30px;
	color: #555;
	margin-bottom: 5px;
}

.short_overview {
    margin-top: 20px;
    color: black;
    line-height: 25px;
    font-weight: 500;
    
}

.chat{
   background-color: #01D281;
   color: white;
   padding: 10px 20px;
   border: none;
   width: 95px;
   
   cursor: pointer;
   display: inline-block;
   text-align: center;
   text-decoration: none;
   align-content: left;
}


.chat123{
display:flex;
justify-content: space-between;
}
.chat:hover {
   background-color: black;
}
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>



    <%
    
    PotUsers member = (PotUsers) session.getAttribute("member");
    
    int sale_idx;
    try {
        sale_idx = Integer.parseInt(request.getParameter("sale_idx"));
    } catch (NumberFormatException e) {
        sale_idx = 0; // 기본값 설정 또는 에러 처리
    }
    SaleDAO dao = new SaleDAO();
    PotSale board = dao.getBoard(sale_idx);

    String[] imgFiles = Optional.ofNullable(board.getSale_img())
                                .filter(s -> !s.isEmpty())
                                .map(s -> s.split(","))
                                .orElse(new String[0]);
    %>
	<div class="content">
		
	    <div class="slider-container">
	        <% 
	        for(int i = 0; i < imgFiles.length; i++) {
	        %>
	            <div class="slide <%= i == 0 ? "active" : "" %>">
	                <img src="../upload/<%=imgFiles[i]%>" alt="Image <%=i%>" loading="lazy">
	            </div>
	        <% 
	        }
	        %>
	        <button class="prev" onclick="changeSlide(-1)" aria-label="Previous slide">❮</button>
	        <button class="next" onclick="changeSlide(1)" aria-label="Next slide">❯</button>
	    </div>
	
	    <div class="right-space">
    
       <div class="product-meta-data" style="flex: 2;">
        <div class="line"></div>
        <a href="product-details.html">
          <h2><%= board.getSale_title() %></h2>
        </a>
        
        <p class="product-price"><%=board.getSale_price() %>원</p>
        <br><div class="chat123"></a><b class="product_user_nick"><font size="5px"><%=board.getUser_nick() %></font></b>
        <%if(member != null) { %>
        <form action="makechatroom">
        <input type="hidden" value="<%=sale_idx%>" name="sale_idx">
        <input type="hidden" value="<%=board.getUser_id()%>" name="sale_id">
        <input type="hidden" value="<%=member.getUser_id()%>" name="user_id">
        <button type="submit" class="chat">채팅하기</button>
        </form>
        <%} %>
        </div>
        <br><p class="product_date"><%=board.getCreated_at() %></p>
        
        <div class="short_overview my-5">
        <p><%=board.getSale_content() %></p>
          
          
        </div>
      </div>
        
    </div>

	</div>
    <script>
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');

        function showSlide(index) {
            slides.forEach((slide, i) => {
                slide.style.opacity = i === index ? '1' : '0';
            });
        }

        function changeSlide(direction) {
            currentSlide = (currentSlide + direction + slides.length) % slides.length;
            showSlide(currentSlide);
        }

        // 초기 슬라이드 표시
        showSlide(currentSlide);
    </script>

<div>


<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>