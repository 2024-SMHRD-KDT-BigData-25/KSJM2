<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>식물 가게</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container1 {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            padding-top: 100px;
        }
        .search-section {
            margin-bottom: 20px;
        }
        .search {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            font-size: 16px;
            box-sizing: border-box;
            background-color: #FAFAFA;
            border: 0px;
            border-radius: 10px;
            text-align: left;
        }
            
        
        .popular-plants {
            margin-top: 20px;
        }
        .popular-plants h2 {
            font-size: 18px;
            margin-bottom: 15px;
            margin-left: 10px;
        }
        .plant-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }
        .plant-item {
            text-align: center;
            
        }
        .plant-item img {
            width: 150px;
            height: 150px;
            border-radius: 10px;
        }
        .plant-text {
        	text-align: left;
        	padding: 70px 0 ;
        }
    </style>
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
</head>
<body>
<header></header>
    <div class="container1">
        <!-- 검색 섹션 -->
        <div class="search-section" align="center">
            <form action="search.jsp" method="get">
                <div class="search">어찌고저찌고</div>
                
            </form>
        </div>

        <!-- 인기 식물 섹션 -->
        <div class="popular-plants">
            <h2>검색 결과</h2>
            <div class="plant-grid">
                <div class="plant-item">
                    <img src="../img/2.jpg" alt="식물 1">
                </div>
                <div class="plant-item">
                	<div class="plant-text">뭔식물인지 모름 1</div>
                </div>
                <div class="plant-item">
                    <img src="../img/4.jpg" alt="식물 2">
                </div>
                <div class="plant-item">
                	<div class="plant-text">뭔식물인지 모름 2</div>
                </div>
                <div class="plant-item">
                    <img src="../img/5.jpg" alt="식물 3">
                </div>
                <div class="plant-item">
                	<div class="plant-text">뭔식물인지 모름 3</div>
                </div>
                <div class="plant-item">
                    <img src="../img/박쥐란.png" alt="식물 1">
                </div>
                <div class="plant-item">
                	<div class="plant-text">박쥐란</div>
                </div>
                <div class="plant-item">
                    <img src="../img/스투키 컬러 홥문.png" alt="식물 2">
                </div>
                <div class="plant-item">
                	<div class="plant-text">스투키 컬러 홥문</div>
                </div>
                <div class="plant-item">
                    <img src="../img/스프링골풀.png" alt="식물 3">
                </div>
                <div class="plant-item">
                	<div class="plant-text">스프링골풀</div>
                </div>
                <div class="plant-item">
                    <img src="../img/아리우카리아.png" alt="식물 3">
                </div>
                <div class="plant-item">
                	<div class="plant-text">아리우카리아</div>
                </div>
                <div class="plant-item">
                    <img src="../img/제두나 셀렘.png" alt="식물 3">
                </div>
                <div class="plant-item">
                	<div class="plant-text">제두나 셀림</div>
                </div>
                <div class="plant-item">
                    <img src="../img/틸란드시아 카피타타.png" alt="식물 3">
                </div>
                <div class="plant-item">
                	<div class="plant-text">틸란드시아 카피타타</div>
                </div>
            </div>
        </div>
    </div>

<footer></footer>
</body>
</html>
