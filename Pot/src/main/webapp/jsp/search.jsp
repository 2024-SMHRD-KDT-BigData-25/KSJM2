<%@page import="com.smhrd.model.PotPlant"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.PlantDAO"%>
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

	<%
		PlantDAO dao = new PlantDAO();
	
		List<PotPlant> list = dao.plant();
		
		int count = 0;
	%>

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
            <%for(PotPlant p:list){ %>
                <a href="plantview.jsp?pl_idx=<%=p.getPl_idx()%>"><div class="plant-item">
                    <img src="<%=p.getPl_img()%>" alt="<%=p.getPl_name()%>">
                </div></a>
               <% count++;
               if(count==9){
            	   break;
               }
               } %>
            </div>
        </div>
    </div>
</main>

<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
