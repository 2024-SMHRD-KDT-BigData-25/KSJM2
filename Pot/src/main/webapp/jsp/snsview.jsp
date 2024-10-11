<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.PotLike"%>
<%@page import="com.smhrd.model.LikeDAO"%>
<%@page import="com.smhrd.model.PotCmt"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CmtDAO"%>
<%@page import="com.smhrd.model.PotUsers"%>
<%@page import="com.smhrd.model.PotSns"%>
<%@page import="com.smhrd.model.SnsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 상세페이지</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 20px;
	background: linear-gradient(to right, #f6f5f7, #01D281);
	color: #333;
	text-align: left;
}

.container {
	max-width: 800px;
	margin: auto;
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	border: 2px solid #80deea;
}

h1 {
	margin-top: 0;
	font-size: 2em;
	color: black;
}

.post-meta {
	font-size: 0.9em;
	color: #555;
	margin-bottom: 20px;
}

.post-content {
	margin-top: 20px;
	line-height: 1.6;
	font-size: 1.1em;
}

.like-section {
	margin-bottom: 10px;
}

.like-button {
	border: none;
	cursor: pointer;
	display: flex;
	align-items: center;
	font-size: 1.2em;
	padding: 5px; /* 항상 보이기 위한 padding */
}

.liked {
	color: #e91e63; /* 하트 색상 */
}

.comment-section {
	margin-top: 30px;
	border-top: 2px solid #01D281;
	padding-top: 20px;
}

.comment {
	border-bottom: 1px solid #eee;
	padding: 10px 0;
	position: relative;
}

.comment:last-child {
	border-bottom: none;
}

.comment-meta {
	font-size: 0.8em;
	color: #777;
}

.comment-author {
	font-size: 0.9em;
	font-weight: bold;
}

.reply-button, .submit-reply {
	background-color: #004d40;
	font-size: 0.8em;
	padding: 5px 10px;
	border: none;
	color: white;
	cursor: pointer;
	margin-top: 5px;
}

.reply-form {
	display: none;
	margin-top: 10px;
	margin-left: 20px;
}

textarea {
	border: 2px solid #01D281;
	border-radius: 5px;
	padding: 5px;
	width: calc(100% - 12px);
	resize: none;
	margin-bottom: 10px;
	font-size: 0.9em;
}

button {
	background-color: #01D281;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1em;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #004d40;
}
* {
font-family: 'SUIT';
}
</style>
<script src="https://kit.fontawesome.com/eefb1e8780.js" crossorigin="anonymous"></script>
</head>
<body>

<%

	// 유저 정보 불러오기
	PotUsers member = (PotUsers)session.getAttribute("member");


    // 게시물 불러오기
    int sns_idx = Integer.parseInt(request.getParameter("sns_idx"));
    SnsDAO dao = new SnsDAO();
    
    // 조회수
    int views = dao.views(sns_idx);
    
    // 좋아요
    LikeDAO likedao = new LikeDAO();
    
    // 좋아요 수
    int snslike = likedao.count(sns_idx);
    
    // 좋아요 유무
    
    PotLike likeres = null;
    
    if(member != null){
    PotLike likeuser = new PotLike(sns_idx, member.getUser_id());
    likeres = likedao.likeuser(likeuser);
    }
    
    
    
    
    PotSns board = dao.getBoard(sns_idx);
    
    String[] imgFiles = null;
    if (board.getSns_img() != null && !board.getSns_img().isEmpty()) {
        imgFiles = board.getSns_img().split(",");
    } else {
        imgFiles = new String[0]; // 빈 배열로 초기화
    }
    
    
    // 댓글 불러오기
    CmtDAO Dao = new CmtDAO();
    List<PotCmt> cmtlist = Dao.getList(sns_idx);
%>

<div class="container">
    <h1><%=board.getSns_title() %></h1>
    <div class="post-meta">
        <span>작성자: <%=board.getUser_nick() %></span> | 
        <span>작성일: <%=board.getCreated_at() %></span> | 
        <span id="viewCount">조회수: <%=board.getSns_views() %></span> <!-- 조회수 표시 -->
        <% if(member != null && board.getUser_id().equals(member.getUser_id())) {%>
        	<button class="submit-reply" data-idx="<%=board.getSns_idx()%>" id="snsdel-button" style="float: right;">삭제</button>
        <%} %>
    </div>
    <div class="post-content">
        <% 
            // 여러 개의 이미지 파일을 반복해서 출력
            
            for(String img : imgFiles) {
                if(img != null && !img.trim().isEmpty()) { %>
        <img src="../upload/<%=img.trim()%>" style="max-width: 200px; margin-right: 10px;">
        <% 
                } 
            } %>
        <br>
        <%=board.getSns_content() %>
    </div>

    <div class="like-section">
    
    <%if(member != null){ 
    	if(likeres != null){ %>
		<form action="likedelete">
    	<input type="hidden" name="sns_idx" value=<%=sns_idx %>>
    	<input type="hidden" name="user_id" value=<%=member.getUser_id() %>>
        <button type="submit" id="likeButton" class="like-button">
            <i class="fa-solid fa-seedling"></i> <span id="likeCount"><%=snslike%></span>
        </button>
		</form>
	
	<%} else{%>
	    <form action="likeinsert">
    	<input type="hidden" name="sns_idx" value=<%=sns_idx %>>
    	<input type="hidden" name="user_id" value=<%=member.getUser_id() %>>
        <button type="submit" id="likeButton" class="like-button">
            <i class="fa-solid fa-seedling"></i> <span id="likeCount"><%=snslike %></span>
        </button>
		</form>
	<%} 
	}else{%>
        <button type="button" id="likeButton" class="like-button" onclick="alert('로그인 후 이용 가능합니다.')">
            <i class="fa-solid fa-seedling"></i> <span id="likeCount"><%=snslike %></span>
        </button>
	<%} %>
	
	
    
    </div>

    <div class="comment-section" id="comment-section">
        <h2></h2>
        <div class="comment">
        	<div id="comment__list">  	
			</div>
        </div>
        <form action="CmtInsert">
            <input type="hidden" name="sns_idx" value="<%= sns_idx %>">
            <%if(member != null) {%>
            <input type="hidden" name="user_id" value="<%= member.getUser_id() %>">
            <%} %>
            <textarea name="cmt_content" placeholder="댓글을 입력하세요" rows="3"></textarea>
            <%if(member != null) {%>
            <input type="submit" value="댓글 작성">
            <% } else { %>
            <input type="button" value="댓글 작성" onclick="alert('로그인 후 작성 가능합니다.')">
            <%} %>
        </form>
        
        <div id="comment__list">
		    	
		</div>
    </div>
</div>



<script>

	var memberId = <%= member != null ? "'" + member.getUser_id() + "'" : "null" %>;

	// 게시글 삭제
	document.addEventListener("DOMContentLoaded", function() {
	    document.getElementById("snsdel-button").addEventListener("click", function() {
	        var sns_idx = this.getAttribute("data-idx"); // sns_idx 값을 가져옵니다.
	        
	        // sns_idx 값을 콘솔에 출력
	        console.log("sns_idx: " + sns_idx);
	        
	        // 팝업 열기
	        var popup = window.open("snsdelconfirm.jsp?sns_idx=" + sns_idx, "popup", "width=400,height=300");
	    });
	});


	
	
	// 대댓글 버튼 클릭 시 대댓글 입력 필드 보이기
	const replyButtons = document.querySelectorAll('.reply-button');
	replyButtons.forEach((button) => {
	    button.addEventListener('click', function() {
	        const replyForm = this.nextElementSibling;
	        replyForm.style.display = replyForm.style.display === 'block' ? 'none' : 'block';
	    });
	});
	
	
	
	$(document).ready(function(){
		getList()
	})
	
	function getList(){
		$.ajax({
			url: "CmtList", // 요청경로
			data: {"sns_idx": <%=sns_idx%>},
			type: "get", // 요청방식(http 요청 메서드)
			success: printList,
			error: function(){
				alert("통신 실패!")
			}
		})
	}
	
    // JavaScript에서 사용할 수 있도록 member의 user_id를 정의합니다.

    function printList(data) {
        var data = JSON.parse(data);
        var html = ""; // 댓글 목록을 추가할 html 코드

        for (var board of data) {
            html += "<div class='comment'>";
            html += "<span class='comment-author'>" + board.user_nick + "</span>";
            html += "<p class='comment-meta'>" + board.created_at + "</p>";
            html += "<p>" + board.cmt_content + "</p>";
            html += "<button class='reply-button'>답글쓰기</button>";
            // memberId가 null이 아닐 경우 삭제 버튼을 추가
            if (memberId !== null && board.user_id === memberId) {
                html += "<button class='reply-button' id='cmtdel-button' style='float: right;' onclick='deletecmt(" + board.cmt_idx + ")'>삭제</button>";
            }
            html += "<div class='reply-form'>";
            html += "<textarea placeholder='대댓글을 입력하세요.' rows='2'></textarea>";
            html += "<button class='submit-reply'></button>";
            html += "</div>";
            html += "</div>";
        }

        $("#comment__list").html(html);
        
    	 // 댓글 총 개수 업데이트
        $('#comment-section h2').text("댓글 (총 " + data.length + "개)");
    	 
    }

	
	function deletecmt(cmt_idx){
		$.ajax({
			url: "CmtDelete",
			data: {"cmt_idx": cmt_idx}, // 서버로 보낼 데이터 (json)
			type: "get",
			success: getList,
			error:function(){
				alert("통신실패!")
			}
		})
		
	}
	
	
	
</script>
</body>
</html>
