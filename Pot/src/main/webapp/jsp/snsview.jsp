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
    </style>
    <script src="https://kit.fontawesome.com/eefb1e8780.js" crossorigin="anonymous"></script>
</head>
<body>

	<%
		int sns_idx = Integer.parseInt(request.getParameter("sns_idx"));
		SnsDAO dao = new SnsDAO();
		PotSns board = dao.getBoard(sns_idx);
		
	    String[] imgFiles = null;
	    if (board.getSns_img() != null && !board.getSns_img().isEmpty()) {
	        imgFiles = board.getSns_img().split(",");
	    } else {
	        imgFiles = new String[0]; // 빈 배열로 초기화
	    }
	%>

    <div class="container">
        <h1><%=board.getSns_title() %></h1>
        <div class="post-meta">
            <span>작성자: <%=board.getUser_id() %></span> | 
            <span>작성일: <%=board.getCreated_at() %></span> | 
            <span>조회수: <%=board.getSns_views() %></span>
        </div>
        <div class="post-content">
			<% 
				// 여러 개의 이미지 파일을 반복해서 출력
				for(String img : imgFiles) {
					if(img != null && !img.trim().isEmpty()) { %>
				<img src="../upload/<%=img.trim()%>" style="max-width:200px; margin-right:10px;">
			<% 
				} 
			} %>
			<br>
			<%=board.getSns_content() %>

        </div>
        
        <div class="like-section">
            <button id="likeButton" class="like-button"><i class="fa-solid fa-seedling"></i></i> <span id="likeCount"><%=board.getSns_likes() %></span></button>
        </div>

        <div class="comment-section">
            <h2>댓글 (총 2개)</h2>
            <div class="comment">
                <span class="comment-author">댓글 작성자 1</span>
                <p class="comment-meta">2024-10-07 10:00</p>
                <p>이 게시글 정말 유익하네요!</p>
                <button class="reply-button">대댓글</button>
                <div class="reply-form">
                    <textarea placeholder="대댓글을 입력하세요..." rows="2"></textarea>
                    <button class="submit-reply">대댓글 작성</button>
                </div>
            </div>
            <div class="comment">
                <span class="comment-author">댓글 작성자 2</span>
                <p class="comment-meta">2024-10-07 10:30</p>
                <p>좋은 정보 감사합니다!</p>
                <button class="reply-button">대댓글</button>
                <div class="reply-form">
                    <textarea placeholder="대댓글을 입력하세요..." rows="2"></textarea>
                    <button class="submit-reply">대댓글 작성</button>
                </div>
            </div>
            <form>
                <textarea placeholder="댓글을 입력하세요..." rows="3"></textarea>
                <button type="submit">댓글 작성</button>
            </form>
        </div>
    </div>

  
</body>
</html>
