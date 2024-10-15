<%@page import="com.smhrd.model.PotChat"%>
<%@page import="com.smhrd.model.ChatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
        #message-box {
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
			margin-left: 20px;
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

	<%
	int chat_idx;
	if(request.getParameter("chat_idx")==null){
	PotChat chatroom = (PotChat)session.getAttribute("chatroom");
	chat_idx = chatroom.getChat_idx();
	} else if((PotChat)session.getAttribute("chatroom")==null){
		chat_idx = Integer.parseInt(request.getParameter("chat_idx"));
	}
	%>
	
	
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
        <div id="message-box">
        </div>

        <!-- 메시지 입력 폼 -->
        <div class="footer1">
                <input type="text" id="message" placeholder="메시지를 입력하세요">
                <button id="send-btn" onclick="send()"><img class="push" src="../img/종이비행기.png"></button>
        </div>
    </div>
    </main>
    <footer></footer>
    
    
        <script>
        
     // 웹 소켓 서버에 연결(WebSocket)

    	const chatIdx = <%=chat_idx%>; // EL을 사용해 JSTL로 값을 전달
        console.log("chatIdx:", chatIdx);

    	
          const webSocket = new WebSocket("ws://172.30.1.38:8081/Pot/jsp/chat/" + chatIdx );

          webSocket.onopen = onOpen;
          webSocket.onclose = onClose;
          webSocket.onmessage = onMessage;

          // 메시지를 LocalStorage에 저장
          function saveToLocalStorage(msg) {
              let chatHistory = localStorage.getItem("chatHistory") || "";
              chatHistory += msg + "\n";
              localStorage.setItem("chatHistory", chatHistory);
          }

          // LocalStorage에서 메시지를 불러오기
          function loadFromLocalStorage() {
              let chatHistory = localStorage.getItem("chatHistory") || "";
              let messages = chatHistory.split("\n");

              messages.forEach(function(message) {
                  if (message.trim() !== "") {
                      displayMessage(message);
                  }
              });
          }

          // 페이지가 로드될 때 저장된 메시지 로드
          window.onload = function() {
              loadFromLocalStorage();
          };

          // 브라우저가 닫히거나 새로고침될 때 LocalStorage 삭제
          window.onbeforeunload = function() {
              localStorage.removeItem("chatHistory");
          };

          function onOpen() {
              // 클라이언트가 연결되었을 때
          }

          function onClose() {
              // 연결 종료 시 처리
          }

          function onMessage(msg) {
              // 받은 메시지를 화면에 출력
              var msgData = msg.data;
              if (msgData.includes("\n")) {
                  var messages = msgData.split("\n");
                  messages.forEach(function(message) {
                      if (message.trim() !== "") {
                          displayMessage(message);
                          saveToLocalStorage(message);  // 받은 메시지 저장
                      }
                  });
              } else {
                  displayMessage(msgData);
                  saveToLocalStorage(msgData);  // 받은 메시지 저장
              }
          }

          function displayMessage(msg) {
    		const now = new Date();
    				const timeString = now.toLocaleTimeString(		'ko-KR', {
    				    hour: '2-digit',      // 두 자리로 시간 표시
    				    minute: '2-digit',    // 두 자리로 분 표시
    				    hour12: true          // 12시간 형식(오전/오후)
    				});
              var str = "<div class='message'>";
              str += "<p>" + msg + "</p>";
              str += "</div>";
              

              $("#message-box").append(str);

              let area = document.getElementById("message-box");
              area.scrollTop = area.scrollHeight;
          }

          function send() {
    		const now = new Date();
    		const timeString = now.toLocaleTimeString(		'ko-KR', {
    		    hour: '2-digit',      // 두 자리로 시간 표시
    		    minute: '2-digit',    // 두 자리로 분 표시
    		    hour12: true          // 12시간 형식(오전/오후)
    		});
              let msg = $("#message").val();

              if (msg.trim() === "") {
                  return;  // 빈 메시지는 전송하지 않음
              }

              var str = "<div class='message self'>";
              str += "<p>" + msg + "</p>";
              str += "</div>";


              $("#message-box").append(str);

              let area = document.getElementById("message-box");
              area.scrollTop = area.scrollHeight;

              webSocket.send(msg);  // 메시지 전송
              saveToLocalStorage(msg);  // 전송한 메시지 저장

              // 입력 필드 비우기
              $("#message").val("");
          }

          // Enter 키를 누르면 전송
          $("#message").keypress(function(event) {
              if (event.key === "Enter") {
                  event.preventDefault();  // 기본 동작 방지 (폼 제출 등)
    			  $("#send-btn").click();
              }
          });

    	  

          
          </script>

</body>
</html>
