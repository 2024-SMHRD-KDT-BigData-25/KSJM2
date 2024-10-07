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
        /* 페이지 전체의 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex; /* Flexbox로 정렬 */
            justify-content: space-between; /* 슬라이더와 오른쪽 공간 사이에 여백을 분배 */
            align-items: flex-start; /* 상단 정렬 */
            height: 100vh; /* 화면 전체 높이 사용 */
        }

        /* 슬라이더 컨테이너 */
        .slider-container {
            position: relative; /* 내부에 위치하는 요소들을 기준으로 배치 */
            width: 30%; /* 슬라이더의 너비를 50%로 설정 */
            overflow: hidden; /* 슬라이더 범위를 벗어나는 요소 숨기기 */
            border: 2px solid #ccc; /* 슬라이더 테두리 */
            padding-bottom: 28%; /* 높이를 비율로 설정 (너비의 28%) */
            height: 0; /* 높이 0으로 설정하고 패딩을 사용하여 비율 조절 */
            margin-top: 5%; /* 위쪽 여백 추가 */
            margin-left: 15%; /* 왼쪽 여백 추가 */
        }

        /* 슬라이더에 포함된 개별 슬라이드 */
        .slide {
            display: none;
            position: absolute;
            width: 100%;
            height: 100%; /* 슬라이드 높이 100%로 설정 */
        }

        /* 슬라이드 안의 이미지 스타일 */
        .slide img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* cover or contain 사용하기 이미지 비율을 유지하면서 슬라이드 영역에 맞춤 */
        }

        /* 현재 보여지고 있는 슬라이드 */
        .active {
            display: block;
            
        }

        /* 슬라이드 전환 시 페이드 효과 */
        @keyframes fadeEffect {
            from { opacity: 0.4; }
            to { opacity: 1; }
        }

        /* 슬라이드 버튼 (이전/다음) 스타일 */
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
        }

        /* '이전' 버튼 위치 */
        .prev {
            left: 10px;
        }

        /* '다음' 버튼 위치 */
        .next {
            right: 10px;
        }

        /* 슬라이더 오른쪽에 위치한 공간 스타일 */
        .right-space {
            width: 30%; /* 오른쪽 공간의 너비 설정 */
            margin-top: 5%; /* 위쪽 여백 추가 */
            margin-right: 15%;
            padding: 20px;
            border: 2px dashed #000; /* 대시 테두리 */
            box-sizing: border-box; /* 패딩을 포함한 박스 모델 계산 */
            background-color: #fff;
        }
    </style>
</head>
<body>

 	<%
 	int sale_idx = Integer.parseInt(request.getParameter("sale_idx"));
 	SaleDAO dao = new SaleDAO();
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
        <h2>오른쪽 콘텐츠</h2>
        <p>여기에 원하는 내용을 추가하세요.</p>
        <p>여기에 원하는 내용을 추가하세요.</p>
        <p>여기에 원하는 내용을 추가하세요.</p>
        <p>여기에 원하는 내용을 추가하세요.</p>
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
