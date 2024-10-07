<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 등록중</title>

	<script type="text/javascript" src="../member.js"></script>
	
	<style type="text/css">
	
	#vp{
    	position: relative;
    	left: 25vw; /* 뷰포트 너비의 10% 위치 */
	}
	
	
	
	</style>


</head>
<body>

	<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	
	<form action="SaleWrite" method="post" name="frm" enctype="multipart/form-data" onsubmit="return salecheck()">
		<div id="vp">
			<div>
				<label id="category">카테고리:</label>
				<div>
					<select id="category" name="sale_category">
						<option value="">카테고리
						<option value="식물">식물
						<option value="용품">용품
						<option value="기타">기타				
					</select>
				</div>
			</div>
			
			<div>
	    		<label style="display: inline-block; width: 60px;  margin-right: 0px;">상품명:</label><br>
	    		<input type="text" name="sale_title" placeholder="제목" style="display: inline-block; width: calc(50%);">
	    		<input type="hidden" name="user_id" value="<%=member.getUser_id() %>"> <!-- 화면에 보이지 않아서 css 연결 안해도 됨 -->
			</div>
		
			<div>
				<label style="display: inline-block; width: 60px;  margin-right: 0px;">가격:</label><br>
				<input type="text" name="sale_price" placeholder="가격을 입력해주세요"  style="display: inline-block; width: calc(50%);">
				
			</div>
			
			<div>
				<label>사진:</label>
				<div>
	    			<input type="file" name="img" id="img" multiple="multiple">
				</div>
			</div>
			<div>
				<labelstyle="display: inline-block; width: 60px;  margin-right: 0px; text-align: right;">내용:</label>
			</div>
			
			<div s>
				
				<textarea rows="10" name="sale_content"  style="display: inline-block; width: 50%; height: 50vh;"></textarea>
				
			</div>
		</div>
		<div align="center">
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