<%@page import="com.smhrd.model.PotSale"%>
<%@page import="com.smhrd.model.SaleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식물마켓 | POTPOT</title>

<link rel="stylesheet" href="../CSS/market_content.css">


</head>
<body>

 	<%
 	int sale_idx = Integer.parseInt(request.getParameter("sale_idx"));
 	SaleDAO dao = new SaleDAO();
 	PotSale board = dao.getBoard(sale_idx);
 	
    // sale_img가 null인 경우를 체크
    String[] imgFiles = null;
    if (board.getSale_img() != null && !board.getSale_img().isEmpty()) {
        imgFiles = board.getSale_img().split(",");
    } else {
        imgFiles = new String[0]; // 빈 배열로 초기화
    }
 	%>
 	
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    	<table class="table table-bordered">
    	    <tr>
    			<td>작성일</td>
    			<td><%=board.getCreated_at()%></td>
    		</tr>
    		
    		<tr>
    			<td>번호</td>
    			<td><%=board.getSale_idx() %></td>
    		</tr>
    		
    		<tr>
    			<td>제목</td>
    			<td><%=board.getSale_title() %></td>
    		</tr>
    		
    		<tr>
    			<td>작성자</td>
    			<td><%=board.getUser_id() %></td>
    		</tr>
    		
    		<tr>
    			<td>가격</td>
    			<td><%=board.getSale_price() %></td>
    		</tr>
    		
    		<tr>
    			<td>이미지</td>
    			<td>
    				<% 
    				// 여러 개의 이미지 파일을 반복해서 출력
    				for(String img : imgFiles) {
    				    if(img != null && !img.trim().isEmpty()) { 
    				%>
    				    <img src="../upload/<%=img.trim()%>" style="max-width:200px; margin-right:10px;">
    				<% 
    				    } 
    				}
    				%>
    			</td>
    		</tr>
    		<tr>
    			<td>내용</td>
    			<td><%=board.getSale_content() %></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<button class="btn btn-sm btn-info">수정</button>
    				<button class="btn btn-sm btn-warning">삭제</button>
    				<button class="btn btn-sm btn-success">리스트</button>    			
    			</td>
    		</tr>
    	</table>
    
    </div>
 	
</body>
</html>