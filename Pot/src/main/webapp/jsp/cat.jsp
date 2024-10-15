<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅창</title>
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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
        }
        .chat-container {
            width: 100%;
            max-width: 400px;
            margin: auto;
            border-radius: 30px;
            background-color: #F3F3F3;
            display: flex;
            flex-direction: column;
            height: 100vh;
            padding-top: 10px;
        }
        .header1 {
            background-color: #F3F3F3;
            color: #000;
            font-size: 18px;
            text-align: center;
            font-weight: bold;
            height: 50px;
            display: flex;
    		align-items: center;
   			justify-content: center;
   			border-top-left-radius: 20px;
   			border-top-right-radius: 20px;
        }
        .trade-info {
            background-color: #D9D9D9;
            padding: 10px;
            margin: 10px;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid #e0e0e0;
        }
        .trade-info div {
            background-color: #00cc66;
            width: 40px;
            height: 40px;
            border-radius: 5px;
        }
        .trade-info .price {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin-left: 10px;
        }
        .message-box {
            flex-grow: 1;
            padding: 10px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
        }
        .message {
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }
        .message.self {
            justify-content: flex-end;
        }
        .message p {
            padding: 12px 18px;
            border-radius: 25px;
            background-color: #e0e0e0;
            max-width: 70%;
            color: #333;
            word-wrap: break-word;
        }
        .message.self p {
            background-color: #00cc66;
            color: white;
        }
        .footer1 {
            padding: 10px;
            display: flex;
            align-items: center;
            background-color: #F3F3F3;
            border-bottom-left-radius: 20px;
   			border-bottom-right-radius: 20px;
        }
        .footer1 input {
            width: 80%;
            padding: 10px;
            border: 1px solid #dcdcdc;
            border-radius: 25px;
            outline: none;
            font-size: 14px;
            background-color: #D9D9D9;
                margin-left: 20px;
        }
		.footer1 button{
			background-color: #F3F3F3;
			border: none;
			margin-left: 14px;
    		margin-top: 7px;
		}
		.push {
		height: 20px;
		
		}
		
        .goods {
        height: 50px;
   		width: 50px;
   		border-radius: 5px;
    }
    main {
     margin-top: 0px;
    padding: 80px;
}
    </style>
</head>
<body>
<header></header>
<main>
    <div class="chat-container">
        <!-- 상단 헤더 -->
        <div class="header1">
            유저 닉네임
        </div>

        <!-- 거래 정보 상자 -->
        <div class="trade-info">
            <img src="../img/4.jpg" class="goods">
            <p class="price">식물거래 정보</p>
            <p class="price">30,000원</p>
            
        </div>

        <!-- 채팅 메시지 박스 -->
        <div class="message-box">
            <!-- 상대방의 메시지 -->
            <div class="message">
                <p>식물 거래 관련 문의드립니다.</p>
            </div>
            <!-- 나의 메시지 -->
            <div class="message self">
                <p>안녕하세요! 무엇을 도와드릴까요?</p>
            </div>
            <!-- 상대방의 메시지 -->
            <div class="message">
                <p>식물 가격이 30,000원 맞나요?</p>
            </div>
            <!-- 나의 메시지 -->
            <div class="message self">
                <p>네, 맞습니다.</p>
            </div>
        </div>

        <!-- 메시지 입력 폼 -->
        <div class="footer1">
            <form method="POST" action="chat.jsp" style="display: flex; width: 100%;">
                <input type="text" name="message" placeholder="메시지 입력" autocomplete="off" />
                <button type="submit"><img class="push" src="../img/종이비행기.png"></button>
            </form>
        </div>
    </div>
    </main>
    <footer></footer>
</body>
</html>
