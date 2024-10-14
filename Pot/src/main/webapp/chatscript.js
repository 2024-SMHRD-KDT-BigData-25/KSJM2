let isChatOpen = false;

function toggleChat() {
  const chatBox = document.getElementById('chat-box');
  
  if (isChatOpen) {
    chatBox.style.maxHeight = '0'; // 닫기
  } else {
    chatBox.style.maxHeight = '800px'; // 열기
  }
  isChatOpen = !isChatOpen;
}


// 웹 소켓 서버에 연결(WebSocket)
      const webSocket = new WebSocket("ws://localhost:8081/Pot/jsp/main");

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
          var str = "<div class='col-7'>";
          str += "<div class='userchatbox'>";
           str += "<p class='userchat'><strong>" + msg + "</p>";  // memberName을 추가
          str += "</div></div>";

          $("#msgArea").append(str);

          let area = document.getElementById("msgArea");
          area.scrollTop = area.scrollHeight;
      }

      function send() {
          let msg = $("#msg").val();

          if (msg.trim() === "") {
              return;  // 빈 메시지는 전송하지 않음
          }

          var str = "<div class='col-6'>";
          str += "<div class='mychatbox'>";
          str += "<p class='mychat'>" + msg + "</p>";
          str += "</div></div>";

          $("#msgArea").append(str);

          let area = document.getElementById("msgArea");
          area.scrollTop = area.scrollHeight;

          webSocket.send(msg);  // 메시지 전송
          saveToLocalStorage(msg);  // 전송한 메시지 저장

          // 입력 필드 비우기
          $("#msg").val("");
      }

      // Enter 키를 누르면 전송
      $("#msg").keypress(function(event) {
          if (event.key === "Enter") {
              event.preventDefault();  // 기본 동작 방지 (폼 제출 등)
              send();  // 메시지 전송
          }
      });
