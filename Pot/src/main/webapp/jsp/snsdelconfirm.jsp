<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 확인</title>
</head>
<body>

    <h2>정말 삭제하시겠습니까?</h2>
    <button id="okButton">확인</button>
    <button onclick="window.close()">취소</button>

    <script>
    
	    // sns_idx 값을 URL에서 가져옵니다.
	    var urlParams = new URLSearchParams(window.location.search);
	    var sns_idx = urlParams.get("sns_idx");
	
	    document.getElementById("okButton").addEventListener("click", function() {
	        // A 페이지의 idx 값을 C 서블릿으로 전송
	        window.opener.location.href = "SnsDelete?sns_idx=" + sns_idx;
	        window.close(); // 팝업 닫기
	    });
    </script>
</body>
</html>