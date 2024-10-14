<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>식물 찾기 :: POTPOT</title>
    
    <script src="https://kit.fontawesome.com/eefb1e8780.js" crossorigin="anonymous"></script>
    
    <style>
        body {
            font-family: 'SUIT';
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
            width: 81%;
            height: 40px;
            padding: 7px 14px;
            margin-bottom: 20px;
            font-size: 14px;
            box-sizing: border-box;
            
            border: 1px solid #ccc;
            
            
           
        }
        
         input[type="text"]:focus {
         	border-color: #01D281;
		  	outline: 0;
		  	border-width: 1px;
         }
        
        .search-btn {
            width: 35%;
            padding: 10px;
            background-color: white;
            color: #01D281;
            border: 1.5px solid;
            font-size: 16px;
            cursor: pointer;
            border-radius: 50px;
            
        }
        
        .search-btn:hover {
        	color: white;
        	border-color: #01D281;
        	background: #01D281;
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
            	<i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" class="btn-txt" name="pl_search" placeholder="궁금한 식물 이름을 검색해보세요.">
                <input type="submit" class="search-btn" value="검색하기" >
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
