<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"> <!-- 문서의 문자 인코딩을 UTF-8로 설정 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹을 위한 뷰포트 설정 -->
    <title>글쓰기</title> <!-- 문서 제목 설정 -->
    
    <script type="text/javascript" src="../member.js"></script>
    
    
    <style>
        /* 테이블을 중앙에 위치시키기 위한 스타일 */
        table {
            margin: auto;
        }
        /* 텍스트 입력 필드 스타일 */
        input[type="text"] {
            border: 1.5px rgb(71, 241, 153) solid; /* 테두리 색상 및 두께 */
            width: 500px; /* 너비 설정 */
            height: 30px; /* 높이 설정 */
            border-radius: 5px; /* 모서리 둥글기 */
            padding-left: 10px; /* 왼쪽 패딩 */
        }
        /* 텍스트 영역 스타일 */
        textarea {
            border: 1.5px rgb(71, 241, 153) solid; /* 테두리 색상 및 두께 */
            width: 500px; /* 너비 설정 */
            height: 400px; /* 높이 설정 */
            border-radius: 5px; /* 모서리 둥글기 */
            padding-left: 10px; /* 왼쪽 패딩 */
            padding-top: 10px; /* 위쪽 패딩 */
            resize: none; /* 크기 조절 비활성화 */
        }
        /* 섹션 헤더 스타일 */
        .header {
            height: 30px; /* 높이 설정 */
        }
        /* 제출 및 닫기 버튼 스타일 */
        input[type="submit"], .close-button {
            width: 100px; /* 너비 설정 */
            height: 40px; /* 높이 설정 */
            font-size: 15px; /* 글꼴 크기 설정 */
            border: 0; /* 테두리 없음 */
            outline: 1.5px rgb(71, 241, 153) solid; /* 아웃라인 색상 및 두께 */
            border-radius: 5px; /* 모서리 둥글기 */
            padding-left: 10px; /* 왼쪽 패딩 */
            background-color: rgb(71, 241, 153); /* 배경 색상 설정 */
            cursor: pointer; /* 커서를 포인터로 변경 */
        }
        /* 버튼 클릭 시 스타일 변경 */
        input[type="submit"]:active, .close-button:active {
            outline: 1.5px rgb(27, 155, 89) solid; /* 클릭 시 아웃라인 색상 변경 */
            background-color: rgb(77, 221, 146); /* 클릭 시 배경 색상 변경 */
        }
        /* 파일 정보 표시 영역 스타일 */
        #fileInfo {
            margin-top: 10px; /* 위쪽 여백 */
            font-size: 14px; /* 글꼴 크기 설정 */
            color: #555; /* 글자 색상 설정 */
        }
        /* 파일 업로드 라벨 스타일 */
        .file-upload-label {
            cursor: pointer; /* 커서를 포인터로 변경 */
            border: 1px solid #ccc; /* 테두리 색상 설정 */
            padding: 10px; /* 패딩 설정 */
            display: inline-block; /* 인라인 블록으로 표시 */
            background-color: #f9f9f9; /* 배경 색상 설정 */
            border-radius: 4px; /* 모서리 둥글기 */
        }
    </style>
</head>
<body>

	<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
	
<form action="SnsWrite" method="post" name="frm" enctype="multipart/form-data" onsubmit="return snscheck()"> <!-- 폼의 action과 method 설정 -->
<table> 
    <tr><td><h2>글쓰기</h2></td></tr> <!-- 제목 표시 -->
    
    <tr><td class="header">Title</td></tr> <!-- 제목 섹션 헤더 -->
    <tr><td><input type="text" placeholder="제목을 입력하세요" name="sns_title"></td></tr> <!-- 제목 입력 필드 -->
    
    <input type="hidden" name="user_id" value="<%=member.getUser_id() %>"> <!-- 화면에 보이지 않아서 css 연결 안해도 됨 -->
    
    <tr><td class="header">Comment</td></tr> <!-- 내용 섹션 헤더 -->
    <tr><td><textarea placeholder="내용을 입력하세요" name="sns_content"></textarea></td></tr> <!-- 내용 입력 텍스트 영역 -->
    
    <tr><td>
        <label for="fileUpload" class="file-upload-label"> <!-- 파일 업로드를 위한 라벨 -->
            사진
            <input type="file" id="fileUpload" name="img"  multiple="multiple"> <!-- 숨겨진 파일 입력 필드 -->
        </label>
        <div id="fileInfo"></div> <!-- 파일 정보 표시 영역 -->
    </td></tr>
    <tr><td>
        <input type="submit" value="등록" onclick="alert('작성 완료!')"> <!-- 등록 버튼 -->
        <button type="button" class="close-button" onclick="confirm()">닫기</button> <!-- 닫기 버튼 -->
    </td></tr>
</table>
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
