<%@page import="com.smhrd.model.PotUsers"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>식물 상품 리스트</title>
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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #4CAF50;
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 20px auto;
            width: 90%;
        }
        .product {
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin-bottom: 20px;
            text-align: center;
            padding: 15px;
        }
        .product img {
            width: 100%;
            height: 300px;
            border-radius: 10px;
        }
        .product-name {
            font-size: 18px;
            margin: 15px 0 10px;
            text-align: left;
        }
        .product-priceName {
        	display: flex;
        	justify-content: space-between;
        }
        .product-nickName{
            font-size: 16px;
            text-align: left;
        }
        .product-price {
            font-size: 16px;
            color: #555;
            text-align: right;
        }
        .pagination {
            text-align: center;
            margin: 20px 0;
        }
        .pagination a {
            color: #4CAF50;
            padding: 8px 16px;
            text-decoration: none;
            
            margin: 0 5px;
            border-radius: 5px;
        }
        .pagination a.active {
            background-color: #4CAF50;
            color: white;
        }
        .pagination a:hover {
            background-color: #ddd;
        }
         main {
     margin-top: 0px;
    padding: 80px;
}

.menu1 {
	font-size: 50px;
	    border-bottom: solid;
}

.menu1 a{
	color: #01D281;
	padding: 30px;
	text-decoration: none;
    font-weight: bold;
}
.menu1 a:active, a:focus {
            color: lightgreen;
        }



.seleButton{
display: flex;
    align-items: center;
    justify-content: flex-end;
}
.seleBut{
     background-color: rgba(0, 0, 0, 00);
    width: 80px;
    height: 40px;
    margin-top: 5px;
    color: #01D281;
    border-color: #01D281;
    border-radius: 20px;
}


    </style>
</head>
<header></header>
<main>
<body>

 <% PotUsers member = (PotUsers)session.getAttribute("member"); %>
 
	<div class="menu1" align="center">
    <a href="test1.jsp">Plant</a>
    <a href="test1.jsp">Tool</a>
    </div>
    <div class="seleButton">
    	<button class="seleBut">판매하기</button>
    </div>
    <div class="product-list">
        <%-- 하드코딩된 상품 리스트 --%>
        <%
            String[][] products = {
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
                {"기화옌 스투키","nickName", "16000", "../img/2.jpg"},
            };
            
            for (String[] product : products) {
                String name = product[0];
                String nickName = product[1];
                String price = product[2];
                String imagePath = product[3];
        %>
                <div class="product">
                    <img src="<%= imagePath %>" alt="<%= name %>">
                    <div class="product-name"><%= name %></div>
                    <div class="product-priceName">
                    	<div class="product-nickName"><%= nickName %></div>
	                    <div class="product-price">₩<%= price %></div>
                    </div>
                </div>
        <%
            }
        %>
    </div>

    <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">&raquo;</a>
    </div>
</body>
</main>
<footer></footer>
</html>
