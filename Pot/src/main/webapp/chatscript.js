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
      const webSocket = new WebSocket(`ws://localhost:8081/Pot/jsp/main`);

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
	  
	  function loadFromLocalStorage() {
	      let chatHistory = localStorage.getItem("chatHistory") || "";
	      let messages = chatHistory.split("\n");

	      messages.forEach(function(message) {
	          if (message.trim() !== "") {
	              displayMessage(JSON.parse(message));
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
	      try {
	          // JSON 형식으로 수신된 메시지를 파싱
	          var msgData = JSON.parse(msg.data);
	          displayMessage(msgData);
	          saveToLocalStorage(JSON.stringify(msgData));
	      } catch (e) {
	          // 메시지가 JSON 형식이 아닐 경우 일반 텍스트로 처리
	          console.error("JSON 파싱 오류:", e);
	          displayMessage({
	              nickname: "System", 
	              message: msg.data, 
	              time: ""
	          });
	      }
	  }



	  function displayMessage(msgData) {
	      var nickname = msgData.nickname;
	      var message = msgData.message;
	      var time = msgData.time;
	      
	      // 현재 사용자의 닉네임 가져오기 (전역 변수 또는 입력 필드에서 가져올 수 있음)
	      let currentUser = document.getElementById("user-nick").value;

	      // 자신과 상대방 메시지를 구분
	      var str = "";
	      if (nickname === currentUser) {
	          // 자신이 보낸 메시지
	          str += "<span class='NK'>" + nickname + "</span>";
	          str += "<div class='col-6'>";
	          str += "<div class='mychatbox'>";
	          str += "<p class='mychat'><strong>" + message + "</strong></p></div>";
	          str += "<span class='mychtime'>" + time + "</span>";
	          str += "</div>";
	      } else {
	          // 상대방이 보낸 메시지
	          str += "<span class='NKU'>" + nickname + "</span>";
	          str += "<div class='col-7'>";
	          str += "<div class='userchatbox'>";
	          str += "<p class='userchat'><strong>" + message + "</strong></p></div>";
	          str += "<span class='userchtime'>" + time + "</span>";
	          str += "</div>";
	      }

	      $("#msgArea").append(str);

	      // 스크롤을 아래로 이동
	      let area = document.getElementById("msgArea");
	      area.scrollTop = area.scrollHeight;
	  }

      function send() {
		
		let nickname = document.getElementById("user-nick").value;
      const now = new Date();
      const timeString = now.toLocaleTimeString(      'ko-KR', {
          hour: '2-digit',      // 두 자리로 시간 표시
          minute: '2-digit',    // 두 자리로 분 표시
          hour12: true          // 12시간 형식(오전/오후)
      });
          let msg = $("#msg").val();

          if (msg.trim() === "") {
              return;  // 빈 메시지는 전송하지 않음
			  }
		  let messageObject = {
			          nickname: nickname,
			          message: msg,
			          time: timeString
			      };

			      // 메시지를 화면에 표시
			      var str = "<span class='NK'>" + nickname + "</span>";
			      str += "<div class='col-6'>";
			      str += "<div class='mychatbox'>";
			      str += "<p class='mychat'>" + msg + "</p></div>";
			      str += "<span class='mychtime'>" + timeString + "</span>";
			      str += "</div>";

			      $("#msgArea").append(str);
			      
			      let area = document.getElementById("msgArea");
			      area.scrollTop = area.scrollHeight;

			      // JSON으로 변환하여 서버에 전송
			      webSocket.send(JSON.stringify(messageObject));  // JSON 객체를 문자열로 변환하여 전송
			      saveToLocalStorage(JSON.stringify(messageObject));  // 전송한 메시지 저장

			      // 입력 필드 비우기
			      $("#msg").val("");
      }

      // Enter 키를 누르면 전송
      $("#msg").keypress(function(event) {
          if (event.key === "Enter") {
              event.preventDefault();  // 기본 동작 방지 (폼 제출 등)
           $("#send-btn").click();
          }
      });

     
