<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>POTPOT</title>
   <link rel="stylesheet" href="../CSS/main.css">
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="../CSS/chatstyle.css">
    
<!-- 커뮤니티 배너 롤링 css -->

<style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'SUIT'
}

.itme {
  display: flex;
  align-content: flex-start;
  flex-direction: column;
  flex-wrap: wrap;
  overflow: auto;
  vertical-align: middle;
}

.item h4 {
  text-align: center;
  margin-top: 15px;
  font-size: 15px;
  
}

.item span {
  text-align: center;
  height: 100px;
  font-size: 15px;
  color: black;
  overflow:hidden;
  
}

.item p {
  text-align: center;
  color: gray;
  font-size: 13px;
  margin-bottom: 15px;
}

.wrap { 
  overflow: hidden;
}
.roller {
  display: flex;
}
.rolling_list { 
  display: flex;
}
.wrap .rolling_list .item { 
  width: 320px; 
  height: 235px;
  border-radius: 20px;
  border-color: #01D281;
  border-style: solid;
  border-width: 1px;
  display: flex; 
  align-items: center;
  justify-content: flex-start;
  flex-shrink: 0; 
  background: white;
  color: #01D281;
  margin-right: 30px;
  flex-direction: column;
}
.roller .rolling_list.original {
  animation: rollingTop1 70s linear infinite;
}
.roller .rolling_list.clone {
  animation: rollingTop2 70s linear infinite;
}
@keyframes rollingTop1 {
  0% { transform: translateX(0); }
  50% { transform: translateX(-100%); }
  50.01% { transform: translateX(100%); }
  100% { transform: translateX(0); }
}
@keyframes rollingTop2 {
  0% { transition: translateX(0); }
  100% { transform: translateX(-200%); }
}

/* hover시 일시정지 */
.roller:hover .rolling_list {
   animation-play-state: paused;
}

.roller:hover .item:hover  {
  border-color: #01D281;
  border-style: solid;
  border-width: 3px;
}
.col-7 {
	display: flex;
    flex-direction: row;
    align-items: center;
}

.col-6 {
	display: flex;
    flex-direction: row-reverse;
    align-items: center;
}
.mychatbox{
    font-size: 15px;
    text-align: right;
    display: inline-block;

    margin: 5px;
    padding: 5px 8px;
    border-radius: 15px;
    box-shadow: 3px 3px 3px #dbdbdb;
    background-color: #01D281;
}

.userchatbox {
    font-size: 15px;
    text-align: left;
    display: inline-block;

    margin: 5px;
    padding: 5px 8px;
    border-radius: 15px;
    box-shadow: 3px 3px 3px #dbdbdb;
    background-color: white;
}
.mychtime{
	color: gray;
    font-size: 0.8em;
    margin-left: 10px;
}
.userchtime{
	color: gray;
    font-size: 0.8em;
}
.NK{
    display: flex;
    flex-direction: row-reverse;
    font-size: 10px;
    margin-right: 15px;
}
.NKU {
	margin-left: 15px;
    font-size: 10px;
}
</style>
      
      
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<%
    PotUsers member = (PotUsers) session.getAttribute("member");
	
%>
                 
<%if(member != null) { %>
<% String userNick = member.getUser_nick(); %>
<input type="hidden" id="user-nick" value="<%= userNick %>" />
<%} %>
<div class="container">
    <div class="box1">
    	<img class="img1" align="right" src="../img/center1.png">
	    <h1 align="center" class="potpot1">이웃과 가까이,  반려식물은 
	    			<p>더 가까이</p>
	    		<br>동네에서 이웃과 함께하는<br><br></h1>
	    	
	      		<h1 align="center" class="text1"> 반려식물 라이프, POTPOT</h1>
	      		
	     
    
     </div>
</div>

<div class="container">
    <div class="box1"><img class="img2" align="left" src="../img/center2.png">
    <h1 align="center" class="potpot1">빠르고 쉽게 가까운 우리동네에서 <br> 내가 당장 사고싶은 <p>식물을 중고로 거래</p>할 수 있어요</h1>
    <br>
    <h1 align="center" class="potpot2">식집사들만의 <a href="../jsp/snslist.jsp">식물 노하우 커뮤니티</a>와 <br> <a>실시간 채팅</a>을 지금 사용해 보세요!</h1>

</div>
</div>

<br><br><br>

<!-- 커뮤니티 배너 롤링 -->
<div class="wrap">
  <div class="roller">
    <ul class="rolling_list">
      <li class="item">
        <h4>[식물 자랑] <br> 3년 키운 행운목, 드디어 꽃이 폈어요!</h4><br>
        <span>여러분~ 드디어 제 행운목에 꽃이 폈어요! 🎉 <br>
		      3년 동안 정성껏 키웠는데, <br> 이렇게 보답해주니 <br> 너무 감격스럽네요!! <br>
		      꽃 피우는 노하우가 궁금하신 분들, <br> 댓글 남겨주세요!</span><br>
		<p>스마트 님</p>
      </li>
      <li class="item">
       <h4>[초보 가드너] <br> 처음 키우는 몬스테라, 어떻게 하면 잘 자랄까요?</h4><br>
        <span>안녕하세요, 식물 입문자입니다! <br>
		      얼마 전 몬스테라를 입양했는데, <br> 잎이 누렇게 변하고  있어요 😢😢 <br>
		      물은 일주일에 한 번 주고 있고, <br> 창가에 두고 있습니다.<br>
		      혹시 제가 뭘 잘못하고 있는 걸까요?  도와주세요!</span><br>
		<p>손 님</p>
      </li>
      <li class="item">
        <h4>[팁 공유] <br> 집에서 허브 키우기, 이것만 주의하세요</h4><br>
        <span>허브 키우기의 매력에 빠지신 분들 주목! <br>
		      바질, 로즈마리, 민트 등 <br> 인기 허브 키우는 팁 공유합니다. <br>
		      가장 중요한 건 배수와 햇빛! <br> 자세한 내용은 본문을 확인해주세요~</span><br>
		<p>랑태주 님</p>
      </li>
      <li class="item">
        <h4>[질문] <br> 반려식물 여행 갈 때 돌보기, 어떻게 하시나요?</h4><br>
        <span>반려식물 여행 갈 때 돌보기, 어떻게 하시나요? <br>
		      곧 1주일 여행을 가는데, 반려식물들이 걱정되네요. <br>
		      자동 물주기 장치를 사용해본 분 계신가요? <br> 아니면 다른 좋은 방법이 있을까요?<br>
		      여러분의 노하우를 공유해주세요!</span><br>
		<p>yoo 님</p>
      </li>
      <li class="item">
        <h4>[팁 공유] <br>20년 식집사가 공개하는 초보 탈출 가이드 🌱</h4><br>
        <span>안녕하세요, 여러분! 집이 작은 정글로 변한 지 <br>20년째 접어든 베테랑 식집사입니다.  <br>
		      그동안 쌓아온 경험을 바탕으로 <br> 여러분께 꼭 알려드리고 <br>싶은 팁들을 공유하려고 해요. <br> 
		      과습은 식물의 적, 햇빛은 생명,  통풍이 핵심!! <br> </span><br>
		<p>강남헬리콥터맘 님</p>
      </li>
    </ul>
  </div>
</div>

<br><br><br><br>

<!-- 마켓 리스트 -->
<div class="market_list">
	<h1>POTPOT Market</h1>
</div>

<div class="container">
    <a href="#" id="img3" class="box">호야 안젤리나 : 앵글리아나</a>
    <a href="#" id="img4" class="box">피쉬본 선인장</a>
    <a href="#" id="img5" class="box">프랭키 보이 측백나무</a>
</div>

<div class="container">
   <a href="#" id="img6" class="box">박쥐란&nbsp;</a>
   <a href="#" id="img7" class="box">준쿠스 스프링골플&nbsp;</a>
    <a href="#" id="img8" class="box">아리우카리아&nbsp;&nbsp;</a>
</div>
   
   
       <!-- 채팅 -->
    
	<div id="chat-container">
		<div id="chat-header" onclick="toggleChat()">채팅</div>
	    
		<div id="chat-box">
			<div id="msgArea"></div>
			<div id="chat-footer">
				<input type="text" id="msg" placeholder="메시지를 입력하세요">
				<%if(member != null) {%>
				<button id="send-btn" onclick="send()"><img class="push" src="../img/종이비행기.png"></button>
				<%}else{ %>
				<button id="send-btn" onclick="window.location.href='../html/Join_Login.html'"><img class="push" src="../img/종이비행기.png"></button>
				<%} %>
			</div>
		</div>
	</div>
  
<!-- 커뮤니티 배너 롤링 js -->
<script>
let roller = document.querySelector('.roller .rolling_list');
roller.id = 'roller1';
let clone = roller.cloneNode(true)
clone.id = 'roller2';
document.querySelector('.roller').appendChild(clone);
roller.classList.add('original');
clone.classList.add('clone');
</script>

<script src="../chatscript.js"></script>



   
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>