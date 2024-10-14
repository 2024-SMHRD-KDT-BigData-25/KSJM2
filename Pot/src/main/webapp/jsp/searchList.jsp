<%@page import="com.smhrd.model.PotPlant"%>
<%@page import="java.util.List"%>
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
        
        * {
        	font-family: 'SUIT';
        }
        
        body {
            
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
            font-size: 30px;
            font-weight: bold;
            color: #01D281;
            text-align: center;
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
         
         .plant-grid a:hover {
         	text-decoration: underline;
         }
         
         a:link {
         	color:#01D281;
         	
         }
         
         a:visited {
         	color: black;
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

		<% List<PotPlant> list = (List<PotPlant>)session.getAttribute("search");%>
    <div class="container1">
        <!-- 검색 섹션 -->
        <div class="search-section" align="center">
            <form action="searchController" method="get">
            	<i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" name="pl_search" placeholder="궁금한 식물 이름을 검색해보세요.">
                <input type="submit" class="search-btn" value="검색하기">
            </form>
        </div>

		<br><br>

        <!-- 인기 식물 섹션 -->
        <div class="popular-plants">
            <h2>검색 결과</h2> <br><br>
            
            <div class="plant-grid">
            <%for(PotPlant l : list){ %>
                <div class="plant-item">
                	<a href="plantview.jsp?pl_idx=<%= l.getPl_idx()%>"><img src="<%=l.getPl_img()%>" alt="<%=l.getPl_name()%>"></a>
                </div>
                <div class="plant-item">
                	<div class="plant-text"><a href="plantview.jsp?pl_idx=<%= l.getPl_idx()%>"><%=l.getPl_name() %></a></div>
                </div>
                <%} %>
                
            </div>
        </div>
    </div>

<footer></footer>
</body>
</html>
