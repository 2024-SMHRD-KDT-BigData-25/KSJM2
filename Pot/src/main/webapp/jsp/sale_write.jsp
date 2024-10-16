<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 글쓰기</title>

	<script type="text/javascript" src="../member.js"></script>
	
	<style>
    /* 중앙 정렬 스타일 */
    body {

        font-family: Arial, sans-serif;
        display: flex;
        align-items: center; /* 수직 중앙 정렬 */
        height: 100vh; /* 전체 높이 설정 */
        background-color: white; /* 배경색 추가 */
        flex-direction: column;
    }
    table {
        margin: auto;
        background-color: white; /* 테이블 배경색 추가 */
        padding: 20px; /* 테이블 내 여백 추가 */
        border-radius: 8px; /* 테이블 모서리 둥글게 */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    }

    /* 입력 필드 스타일 */
    .category {
        border: 1.5px rgb(71, 241, 153) solid;
        width: 100px;
        height: 30px;
        border-radius: 5px;
        padding-left: 10px;
    }
    
    .label123 {
     border: 1.5px rgb(71, 241, 153) solid;
        width: 500px;
        height: 30px;
        border-radius: 5px;
        padding-left: 10px;
    }

    textarea {
        border: 1.5px rgb(71, 241, 153) solid;
        width: 500px;
        height: 200px;
        border-radius: 5px;
        padding-left: 10px;
        padding-top: 10px;
        resize: none;
    }

    /* 섹션 헤더 스타일 */
    .header {
        height: 30px;
    }

    /* 버튼 스타일 */
    input[type="submit"], input[type="button"] {
        width: 100px;
        height: 40px;
        font-size: 15px;
        border: 0;
        outline: 1.5px rgb(71, 241, 153) solid;
        border-radius: 5px;
        background-color: rgb(71, 241, 153);
        cursor: pointer;
        margin: 10px; /* 버튼 간 여백 추가 */
    }

    /* 버튼 클릭 시 스타일 변경 */
    input[type="submit"]:active, input[type="button"]:active {
        outline: 1.5px rgb(27, 155, 89) solid;
        background-color: rgb(77, 221, 146);
    }
    
    	

    /* 파일 업로드 라벨 스타일 */
    .file-upload-label {
        cursor: pointer;
        border: 1px solid #ccc;
        padding: 10px;
        display: inline-block;
        background-color: #f9f9f9;
        border-radius: 4px;
        margin-bottom: 10px;
    }
    main{
    padding: 80px;
    }
    h2{
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    unicode-bidi: isolate;}
    
    .fileChoise{
    	width : 30px;
    }
     form input::file-selector-button {
        display: none;    

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
<main>
<h2>판매 글쓰기</h2>
	<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	
	<form action="SaleWrite" method="post" name="frm" enctype="multipart/form-data" onsubmit="return salecheck()">
		<div id="vp">
			<div>
				<label id="category">카테고리</label>
				<div>
					<select class="category" name="sale_category">
						<option value="">카테고리
						<option value="식물">식물
						<option value="용품">용품
						<option value="기타">기타				
					</select>
				</div>
			</div>
			
			<div>
	    		<label>상품명</label><br>
	    		<input type="text" name="sale_title" placeholder="제목" class="label123">
	    		<input type="hidden" name="user_id" value="<%=member.getUser_id() %>"> <!-- 화면에 보이지 않아서 css 연결 안해도 됨 -->
			</div>
		
			<div>
				<label>가격</label><br>
				<input type="text" pattern="[0-9]+" title="숫자만 입력이 가능합니다." name="sale_price" placeholder="가격을 입력해주세요" class="label123">
				
			</div>
			
			<div>
				<label>사진</label>
				<div><label>
					<img src="../img/파일선택.png" class="fileChoise">
	    			<input type="file" name="img" id="img" multiple="multiple">
	    			
				</label></div>
			</div>
			<div>
				<label>내용</label>
			</div>
			
			<div>
				
				<textarea rows="10" name="sale_content"></textarea>
				
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
</main>
<footer></footer>
</body>
</html>