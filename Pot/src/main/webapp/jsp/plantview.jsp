<%@page import="com.smhrd.model.PotPlant"%>
<%@page import="com.smhrd.model.PlantDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>식물찾기 Detail | POTPOT</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    
    <style>
    
    	* {
    		font-family: 'SUIT';
    	}
    
        body {
            
            margin: 20px;
            line-height: 1.6;
        }
        
        .container1 {
            width: 800px; /* 컨테이너 너비 설정 */
            margin: 0px auto; /* 위쪽 여백 추가 및 가운데 정렬 */
            border: 0px solid #ccc;
            padding: 100px;
            border-radius: 8px;
            background-color: #fff; /* 배경색을 흰색으로 */
            
        }
        .info {
        
            margin-top: 10px;
            
            
            background-color: #F0FFF0; 
            padding: 15px; /* 패딩 추가 */
            border-radius: 20px; /* 모서리 둥글게 */
        }
        .info p {
            margin: 5px 0;
        }
        .plant-name {
            text-align: center;
            font-size: 28px; 
            margin-top: 10px; 
            color: #01D281;
            font-weight: 900;
        }
        .description {
            text-align: center; /* 설명 중앙 정렬 */
            margin-top: 15px; /* 위쪽 여백 */
        }
        .DC {
        	height: 20px;
        	margin-right: 10px;
        }
        .DC1{
        	height: 20px;
        	margin-right: 10px;
        }
        .DC2{
        	height: 20px;
        	margin-right: 10px;
        }
        .plant-name{
        text-align: left;
        }
        .description{
        text-align: left;
        }
        
        h2 {
        	color: black;
        	font-weight: bold;
        	font-size: 18px;
        	margin-right: 20px;
        	height: 20px;
        	
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

	<% int pl_idx = Integer.parseInt(request.getParameter("pl_idx"));
	
		PlantDAO dao = new PlantDAO();
		
		int views = dao.views(pl_idx);
		
		
		PotPlant res = dao.view(pl_idx);
		
	
	%>
	
    <div class="container1">
        <img src="<%=res.getPl_img() %>" alt="<%=res.getPl_name() %>" style="max-width: 100%; height: 650px; border-radius: 8px;" >
        <div class="plant-name">
        <strong><%=res.getPl_name() %></strong>
        </div>
        <div class="description">
        	
        	<h3>
        		<i class="fa-brands fa-pagelines"></i>
        		<strong>🍀식물 소개</strong>
        	</h3>
            <p><%=res.getPl_kind() %></p>
        </div>
	<br>
        <div class="info">
            <h2>추가 정보 </h2>
            <p><img class="DC">🔆 <%=res.getPl_temp() %></p>
            <%if(res.getPl_time() != null){ %> 
            <p><img class="DC1">💐 <%=res.getPl_time() %></p>
            <%} %>
            <p><img class="DC2">🎀 식물효과 - <%=res.getPl_effect() %></p>
        </div>
    </div>
    
    <footer></footer>
</body>
</html>

