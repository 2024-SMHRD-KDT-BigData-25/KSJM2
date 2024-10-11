<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정 | POTPOT</title>
    
    <link rel="stylesheet" href="../CSS/main.css">
    <link rel="stylesheet" href="../CSS/mypage_edit.css">
    
    <script type="text/javascript" src="../member.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
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
<br><br><br><br>

    <div class="container">
        <div class="header">
            <h1>회원 정보 수정</h1>
           
        </div>
        
        <form class="info-form" action="myinfoupdate" method="post" name="frm"> <!-- Assuming UpdateMemberServlet processes the update -->
            <%
                PotUsers member = (PotUsers)session.getAttribute("member");
            %>

            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="user_id" value="<%= member.getUser_id() %>" readonly> <!-- Read-only since ID cannot be changed -->
            </div>
            
            <div class="form-group">
                <label for="password">패스워드</label>
                <input type="password" id="password" name="user_pw">
            </div>

            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="user_name" value="<%= member.getUser_name() %>" readonly> <!-- Read-only since name usually doesn't change -->
            </div>
            
            <div class="form-group">
                <label for="nick">닉네임</label>
                <input type="text" id="nick" name="user_nick" value="<%= member.getUser_nick() %>">
            </div>

            <div class="form-group zip-group">
                <label for="zip">우편번호</label>
                <div class="zip-container">
                    <input type="text" id="zip" name="user_post" value="<%= member.getUser_post() %>">
                    <button type="button" class="zip-search" onclick="find_Postcode()">검색하기</button>
                </div>
            </div>
            
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="user_addr1" value="<%= member.getUser_addr1() %>">
            </div>

            <div class="form-group">
                <input type="text" id="detail-address" name="user_addr2" value="<%String addr2 = member.getUser_addr2() != null ? member.getUser_addr2() : ""; %>" placeholder="상세 주소 입력">
            </div>

           
            <button type="submit" class="save-btn" onclick="myinfoCheck()">변경사항 저장하기</button>
            <button type="button" class="cancel-btn" onclick="history.back()">취소</button>
        </form>
    </div>
    
    <br><br><br><br><br><br><br>
   <footer></footer>
   
   <script>
   
// 우편번호 함수
   function find_Postcode() {
   	    new daum.Postcode({
   	        oncomplete: function(data) {
   	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

   	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
   	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
   	            var addr = ''; // 주소 변수
   	            var extraAddr = ''; // 참고항목 변수

   	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
   	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
   	                addr = data.roadAddress;
   	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
   	                addr = data.jibunAddress;
   	            }

   	           
   	            // 우편번호와 주소 정보를 해당 필드에 넣는다.

   	            document.frm.user_post.value = data.zonecode;
   	            document.frm.user_addr1.value = addr;
   	            // 커서를 상세주소 필드로 이동한다.
   	            document.frm.user_addr2.focus();
   	        }
   	    }).open();
   	}
   
   </script>
</body>
</html>
