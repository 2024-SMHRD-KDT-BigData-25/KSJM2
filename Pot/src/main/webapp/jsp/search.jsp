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
            margin-bottom: 40px;
        }
        .search-section {
            margin-bottom: 20px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 16px;
            box-sizing: border-box;
            background-color: #FAFAFA;
            border: 0px;
            border-radius: 10px;
        }
        .search-btn {
            width: 60%;
            padding: 10px;
            background-color: #00cc66;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 10px;
            
        }
        .popular-plants {
            margin-top: 20px;
        }
        .popular-plants h2 {
            font-size: 18px;
            margin-bottom: 15px;
        }
        .plant-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }
        .plant-item {
            text-align: center;
        }
        .plant-item img {
            width: 170px;
            height: 170px;
            border-radius: 10px;
        }
    </style>



</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<main>

    <div class="container1">
        <!-- 검색 섹션 -->
        <div class="search-section" align="center">
            <form action="searchController" method="get">
                <input type="text" name="pl_search" placeholder="검색">
                <input type="submit" class="search-btn" value="검색하기">
            </form>
        </div>

        <!-- 인기 식물 섹션 -->
        <div class="popular-plants">
            <h2>인기 식물</h2>
            <div class="plant-grid">
                <div class="plant-item">
                    <img src="../img/2.jpg" alt="식물 1">
                </div>
                <div class="plant-item">
                    <img src="../img/4.jpg" alt="식물 2">
                </div>
                <div class="plant-item">
                    <img src="../img/5.jpg" alt="식물 3">
                </div>
                <div class="plant-item">
                    <img src="../img/박쥐란.png" alt="식물 1">
                </div>
                <div class="plant-item">
                    <img src="../img/스투키 컬러 홥문.png" alt="식물 2">
                </div>
                <div class="plant-item">
                    <img src="../img/스프링골풀.png" alt="식물 3">
                </div>
                <div class="plant-item">
                    <img src="../img/아리우카리아.png" alt="식물 3">
                </div>
                <div class="plant-item">
                    <img src="../img/제두나 셀렘.png" alt="식물 3">
                </div>
                <div class="plant-item">
                    <img src="../img/틸란드시아 카피타타.png" alt="식물 3">
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
