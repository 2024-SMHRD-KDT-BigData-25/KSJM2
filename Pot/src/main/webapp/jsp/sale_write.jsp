<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 등록중</title>

	<script type="text/javascript" src="../member.js"></script>


</head>
<body>

	<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	
	<form action="SaleWrite" method="post" name="frm" enctype="multipart/form-data" onsubmit="return salecheck()">
		
		<div>
			<label>카테고리:</label>
			<div>
				<input type="text" name="sale_category">
			</div>
		</div>
		
		<div>
			<label>상품명:</label>
			<div>
				<input type="text" name="sale_title">
				<input type="hidden" name="user_id" value="<%=member.getUser_id() %>"> <!-- 화면에 보이지 않아서 css 연결 안해도 됨 -->
			</div>
		</div>
	
		<div>
			<label>가격:</label>
			<div>
				<input type="text" name="sale_price">
			</div>
		</div>
		
		<div>
			<label>사진:</label>
			<div>
    			<input type="file" name="img" id="img" multiple="multiple">
			</div>
		</div>
		
		<div>
			<label>내용:</label>
			<div>          
				<textarea rows="10" name="sale_content"></textarea>
			</div>
		</div>
		
		<div>
		<input type="submit" value="작성">
		<input type="button" value="취소" onclick="confirm()">
		</div>
		


	</form>	
	
	<script>
	    const maxFiles = 5; // 최대 파일 개수 제한
	
	    document.getElementById('img').addEventListener('change', function() {
	        const fileCount = this.files.length;
	        if (fileCount > maxFiles) {
	            alert('최대 ' + maxFiles + '개의 파일만 업로드할 수 있습니다.');
	            this.value = ''; // 입력값 초기화
	        }
	    });
    

	</script>

	
</body>
</html>