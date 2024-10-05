<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>이미지 슬라이더</title>
   <style>
	    body {
	        font-family: Arial, sans-serif;
	        margin: 0;
	        padding: 0;
	        background-color: #f4f4f4;
	    }
	    .carousel {
	        position: relative;
	        left:15%;
	        width: 30%; /* 슬라이더 너비를 40%로 설정 */
	        /* margin: auto;  중앙 정렬 */
	        overflow: hidden; /* 넘치는 부분 숨기기 */
	        border: 2px solid #ccc; /* 테두리 설정 */
	        /* border-radius: 10px;  둥근 모서리 설정시 */
	        padding-bottom: 30%; /* 높이를 너비의 60%로 설정 */
	        height: 0; /* 높이를 0으로 설정 */
	    }
	
	    .carousel-images {
	        display: flex; /* 이미지들을 수평으로 나열 */
	        transition: transform 0.5s ease; /* 슬라이딩 효과 */
	        position: absolute; /* 위치를 절대값으로 설정 */
	        top: 0;
	        left: 0;
	        right: 0;
	        bottom: 0;
	    }
	
	    .carousel-images img {
	        width: 100%; /* 이미지가 슬라이더의 너비에 맞게 조정 */
	        height: 100%; /* 이미지의 높이를 슬라이더의 높이에 맞게 조정 */
	        object-fit: cover; /* 이미지를 잘라내서 비율 유지 */
	       /* border-radius: 10px;  둥근 모서리 설정시 */
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
	        border-radius: 5px; /* 둥근 버튼 */
	    }
	
	    .prev {
	        left: 10px; /* 왼쪽 버튼 위치 */
	    }
	
	    .next {
	        right: 10px; /* 오른쪽 버튼 위치 */
	    }
	</style>
</head>
<body>

<div class="carousel">
    <div class="carousel-images">
        <img src="https://via.placeholder.com/800x400?text=Image+1" alt="Image 1">
        <img src="https://via.placeholder.com/800x400?text=Image+2" alt="Image 2">
        <img src="https://via.placeholder.com/800x400?text=Image+3" alt="Image 3">
    </div>
    <button class="prev">❮</button>
    <button class="next">❯</button>
</div>

<script>
    let currentIndex = 0;

    document.querySelector('.next').addEventListener('click', () => {
        currentIndex++;
        updateCarousel();
    });

    document.querySelector('.prev').addEventListener('click', () => {
        currentIndex--;
        updateCarousel();
    });

    function updateCarousel() {
        const images = document.querySelector('.carousel-images');
        const totalImages = images.children.length;
        
        if (currentIndex >= totalImages) currentIndex = 0;
        if (currentIndex < 0) currentIndex = totalImages - 1;

        images.style.transform = translateX(${-currentIndex * 100}%);
    }
</script>

</body>
</html>