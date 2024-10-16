<%@page import="com.smhrd.model.PotSale"%>
<%@page import="com.smhrd.model.SaleDAO"%>
<%@page import="com.smhrd.model.PotChat"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ChatDAO"%>
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
	min-height: 700px; /* 최소 높이 설정 (필요시 조정 가능) */
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

        .chat-list {
            margin-top: 20px; /* 채팅방 리스트와 메뉴 사이의 간격 설정 */
            max-height: 300px; /* 최대 높이 설정 (스크롤 가능) */
            overflow-y: auto; /* 내용이 넘칠 경우 스크롤 가능하도록 설정 */
            min-height: 500px;
        }

        .chat-item {
            display: flex; /* flexbox를 사용하여 이미지와 텍스트 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
            padding: 10px;
            border-bottom: 1px solid #e0e0e0; /* 채팅방 항목 아래에 경계선 추가 */
            color: #333; /* 텍스트 색상 설정 */
            cursor: pointer; /* 마우스 커서를 포인터로 변경 */
        }

        .chat-item img {
            width: 55px; /* 이미지 너비 설정 */
            height: 55px; /* 이미지 높이 설정 */
            border-radius: 5px; /* 이미지 모서리 둥글게 */
            margin-right: 10px; /* 이미지와 텍스트 사이의 간격 설정 */
        }

        .chat-item:hover {
            background-color: #f9f9f9; /* 마우스 오버 시 배경색 변경 */
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<%
	
		PotUsers member = (PotUsers)session.getAttribute("member");
	
		ChatDAO chatdao = new ChatDAO();
		
		List<PotChat> chatlist = chatdao.chatlist();
		
		SaleDAO saledao = new SaleDAO();
		
		List<PotSale> salelist = saledao.getList();
	%>
	
	
	
<main>
    <div class="container">
        <div class="header">
            <h2>나의 채팅방</h2>
        </div>
        <div class="menu">
            <!-- 메뉴 내용이 필요하면 여기에 추가 -->
        </div>
        <div class="chat-list">
        <%for(PotChat c : chatlist){ 
        	if(c.getUser_id().equals(member.getUser_id()) || c.getSale_id().equals(member.getUser_id())){
        	 String[] parts = c.getSale_img().split(","); %>
				<a href="chat.jsp?chat_idx=<%=c.getChat_idx()%>"><div class="chat-item">
	                <img src="../upload/<%=parts[0] %>" alt="<%=c.getSale_title()%>">
	                <%=c.getSale_title() %>
	            </div></a>
			<%}
        }%>
            <!-- 더 많은 채팅방 항목을 추가할 수 있습니다 -->
        </div>
    </div>
    </main>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
