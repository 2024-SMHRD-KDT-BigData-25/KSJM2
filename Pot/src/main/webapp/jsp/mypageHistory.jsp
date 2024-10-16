<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.PotSale"%>
<%@page import="com.smhrd.model.SaleDAO"%>
<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #ffffff;
	display: flex;
	justify-content: center;
	align-items: flex-start; /* 수직 정렬을 위로 조정 */
	height: 100vh;
	margin: 0;
	flex-wrap: wrap;
}

.container {
	background-color: rgb(255, 255, 255);
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 400px;
	max-width: 400px;
	padding: 20px;
	margin-top: 100px; /* 위에서 3cm 정도 떨어지게 설정 */
	min-height: 800px; /* 최소 높이 설정 (필요시 조정 가능) */
	margin-bottom: 100px;

}

.header {
	background-color: #f3fdf0;
	padding: 10px;
	border-radius: 8px 8px 0 0;
	display: flex;
	flex-direction: column-reverse;
}

.menu {
	display: flex;
	justify-content: space-around;
	padding: 10px 0;
	border-bottom: 1px solid #1ae156; /* 메뉴 아래에 줄 추가 */
}

.menu button {
	background-color: transparent; /* 버튼 배경색을 투명으로 설정 */
	color: #000000; /* 글자 색상 설정 */
	cursor: pointer; /* 마우스 커서 포인터로 설정 */
	padding: 10px 15px; /* 버튼 내부 여백 설정 */
	border: none; /* 버튼 테두리 삭제 */
	transition: background-color 0.3s; /* 배경색 전환 효과 설정 */
}

.menu button:hover {
	background-color: #ffffff; /* 마우스 오버 시 배경색 설정 */
	color: #1ae156; /* 마우스 오버 시 글자 색상 변경 */
}

.content {
	display: none; /* 초기에는 내용 숨김 */
}

.active {
	display: block; /* active 클래스가 있을 때만 보이게 */
}

.abc{
width:360px;
height:93px;
display: flex; 
justify-content: center; 
margin-top:10px;
margin-left:10px;
}

.imgs{
width:93px;
}

.title{
width:267px;
display: inline-grid;
align-content: center;
}

p{
margin-left:10px;
}

.abab{
width:100%;
height:100%;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<%
		PotUsers member = (PotUsers) session.getAttribute("member");
		SaleDAO dao =  new SaleDAO();
		List<PotSale> list =  dao.getList();

	
	%>
	<main>
		<div class="container">
			<div class="header">
				<h2>나의 거래내역</h2>
			</div>
			<div class="menu">
				<button id="selling">판매내역</button>
				<button id="completed">구매내역</button>
			</div>
			<div class="content active" id="sellingContent">
			<%for(PotSale m : list) {
				if(m.getUser_id().equals(member.getUser_id())){
					String[] parts = m.getSale_img().split(",");%>
				<div class="abc">
					<div class="imgs">
						<a href="slide3.jsp?sale_idx=<%= m.getSale_idx()%>">
							<img class="abab" src="../upload/<%= parts[0] %>" alt="<%= m.getSale_title() %>">
						</a>
					</div>
					<div class="title"><P><strong><a href="slide3.jsp?sale_idx=<%= m.getSale_idx()%>"><%=m.getSale_title() %></a></strong></P></div>
				</div>
				<%}}
			%>
				<!-- 판매내역 목록을 여기에 추가 -->
			</div>
			<div class="content" id="completedContent">
				<div class="abc">
					<div class="imgs">사진</div>
					<div class="title"><P><strong>타이틀</strong></P></div>
				</div>
			</div>
		</div>

		<script>
        const sellingButton = document.getElementById('selling');
        const completedButton = document.getElementById('completed');
        const sellingContent = document.getElementById('sellingContent');
        const completedContent = document.getElementById('completedContent');

        // 판매내역 버튼 클릭 이벤트
        sellingButton.addEventListener('click', () => {
            sellingContent.classList.add('active');
            completedContent.classList.remove('active');
        });

        // 구매내역 버튼 클릭 이벤트
        completedButton.addEventListener('click', () => {
            completedContent.classList.add('active');
            sellingContent.classList.remove('active');
        });
    </script>

	</main>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
