<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.PotUsers"%>
<%@page import="com.smhrd.model.PotSale"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.SaleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">


		<style>
			/* 페이지 배경색 설정 */
			body {
				font-family: Arial, sans-serif;
				background-color: white;
				
			}
			
			#wrap {
				padding-top: 60px; /* header 높이만큼 패딩 추가하여 아래 콘텐츠가 header 아래로 떨어지게 함 */
			}
			
			.product-list {
				display: flex;
				flex-wrap: wrap;
				margin-left: 2%;
				width: 100%;
			}
			/* Flexbox 스타일 추가 */
			.product {
				background-color: #fff;
				border: 1px solid #e0e0e0;
				border-radius: 10px;
				box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
				width: 300px;
				margin: 10px;
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
			
			.product-name a {
				color: inherit;
				text-decoration: none;
			}
			
			.id-price {
				display: flex;
				justify-content: space-between;
			}
			
			.pagination {
				text-align: center;
				margin: 20px 0;
			}
			
			.pagination button {
				color: #01D281;
				padding: 8px 16px;
				text-decoration: none;
				border: solid;
				background-color: white;
				margin: 0 5px;
				border-radius: 5px;
				border-color: #01D281;
			}
			
			.pagination a {
				color: #01D281;
				padding: 8px 16px;
				text-decoration: none;
				border: solid;
				background-color: white;
				margin: 0 5px;
				border-radius: 5px;
				border-color: #01D281;
			}
			
			.pagination a:hover {
				background-color: #4CAF50;
				color: white;
			}
			
			.pagination button:hover {
				background-color: #4CAF50;
				color: white;
			}
			
			.button-container {
				display: flex;
				align-items: center;
				justify-content: flex-end;
			}
			
			.btn {
				background-color: rgba(0, 0, 0, 00);
				width: 80px;
				height: 30px;
				margin-top: 5px;
				margin-right: 10px;
				color: #01D281;
				border-color: #01D281;
				border-radius: 20px;
			}
			
			.btn-success {
				background-color: rgba(0, 0, 0, 00); /* 글 작성 버튼 색상 */
			}
			
			.btn-warning {
				background-color: #ffc107; /* 채팅하기 버튼 색상 */
			}
			
			.btn-success:hover {
				background-color: #218838; /* 글 작성 버튼 호버 색상 */
			}
			
			.btn-warning:hover {
				background-color: #d39e00; /* 채팅하기 버튼 호버 색상 */
			}
			
			main {
				margin-top: 0px;
				padding: 80px;
			}
			
			.menu1 {
				font-size: 50px;
				border-bottom: solid;
			}
			
			.menu1 a {
				color: #01D281;
				padding: 30px;
				text-decoration: none;
				font-weight: bold;
			}
			
			.menu1 a:active, a:focus {
				color: lightgreen;
			}
		</style>

		<title>POP: 식물마켓</title>
	</head>
	<body>
	
<jsp:include page="header.jsp"></jsp:include>


<main>
		<div class="menu1" align="center">
			<a href="salelist.jsp?category=식물">Plant</a> <a href="salelist.jsp?category=도구">Tool</a>
		</div>

		<% PotUsers member = (PotUsers)session.getAttribute("member"); %>

		
		
		<!-- 버튼 컨테이너 추가 -->
		<% if(member == null) { %>
		<% }else { %>
		<div class="button-container">
			<button class="btn btn-success"
				onclick="location.href='sale_write.jsp'">글 작성</button>
		</div>
		<% } %>


		<div class="product-list">
		
			<%
			    // DAO -> 전체 게시물 정보를 가져오는 기능
			    SaleDAO dao = new SaleDAO();
			    List<PotSale> list = dao.getList();
			    String category = request.getParameter("category");
			    System.out.println(category);
			    if (category == null) {
			    	list = dao.getList();
			    } else if (category.equals("도구")){
			    	list = dao.getToolList();
			    } else {
			    	list = dao.getPlantList();
			    }
			    
			    
			
			    // 페이지당 게시물 수
			    int pageSize = 12; // 게시물 수를 24로 변경
			    // 현재 페이지 번호
			    int currentPage = 1; // 기본적으로 첫 페이지
			    if (request.getParameter("page") != null) {
			        currentPage = Integer.parseInt(request.getParameter("page"));
			    }
			
			    // 시작 인덱스 계산
			    int startIndex = (currentPage - 1) * pageSize;
			    int endIndex = Math.min(startIndex + pageSize, list.size());
			
			    // 현재 페이지에 해당하는 게시물 리스트 생성
			    List<PotSale> pagedList = new ArrayList<>(list.subList(startIndex, endIndex));
			    int totalPages = (int) Math.ceil((double) list.size() / pageSize); // 총 페이지 수
			%>
			<% for (PotSale m : pagedList) { %>
				<div class="product">
					<% String[] parts = m.getSale_img().split(","); %>
						<a href="slide3.jsp?sale_idx=<%= m.getSale_idx()%>">
							<img src="../upload/<%= parts[0] %>" alt="<%= m.getSale_title() %>">
						</a>
						<div class="product-name">
							<a href="slide3.jsp?sale_idx=<%= m.getSale_idx()%>"><%= m.getSale_title() %></a>
						</div>
			
						<!-- ID와 Price를 한 줄에 나란히 표시 -->
						<div class="id-price">
							<div class="product-nickName"><%= m.getUser_nick() %></div>
							<div class="product-price"><%= m.getSale_price() %></div>
						</div>
						
				</div>
			<% } %>
		</div>

		<div class="pagination">
			<a href="#">&laquo;</a>
			<% for (int i = 1; i <= totalPages; i++) { %>
			<button onclick="location.href='salelist.jsp?page=<%= i %>'"
				<%= (i == currentPage) ? "disabled" : "" %>>
				<%= i %>
			</button>
			<% } %>
			<a href="#">&raquo;</a>
		</div>



</main>
<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
