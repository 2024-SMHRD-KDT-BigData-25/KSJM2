<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fade Image Slider</title>
    <style>
        /* 기본 슬라이더 스타일 */
        .slider-container {
            position: relative;
            max-width: 100%;
            margin: auto;
        }
        .slide {
            display: none;
            position: absolute;
            width: 100%;
        }
        .slide img {
            width: 100%;
        }
        .active {
            display: block;
            animation: fadeEffect 1.5s ease-in-out;
        }
        /* 페이드 효과 */
        @keyframes fadeEffect {
            from { opacity: 0.4; }
            to { opacity: 1; }
        }
        /* 이전/다음 버튼 스타일 */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            user-select: none;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }
        .prev {
            left: 0;
            border-radius: 0 3px 3px 0;
        }
        .prev:hover, .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }
    </style>
</head>
<body>

<div class="slider-container">
    <div class="slide active">
        <img src="images/image1.jpg" alt="Image 1">
    </div>
    <div class="slide">
        <img src="images/image2.jpg" alt="Image 2">
    </div>
    <div class="slide">
        <img src="images/image3.jpg" alt="Image 3">
    </div>
    <a class="prev" onclick="changeSlide(-1)">&#10094;</a>
    <a class="next" onclick="changeSlide(1)">&#10095;</a>
</div>

<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slide');

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove('active');
            if (i === index) {
                slide.classList.add('active');
            }
        });
    }

    function changeSlide(direction) {
        currentSlide = (currentSlide + direction + slides.length) % slides.length;
        showSlide(currentSlide);
    }

    // 자동 슬라이드 기능
    setInterval(() => {
        changeSlide(1);
    }, 4000); // 4초마다 다음 슬라이드로 이동
</script>

</body>
</html>
