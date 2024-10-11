<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.PotSns"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.SnsDAO"%>
<%@page import="com.smhrd.model.PotUsers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POTPOT :: 커뮤니티</title>
    <script src="https://kit.fontawesome.com/eefb1e8780.js" crossorigin="anonymous"></script>
    
	<link rel="stylesheet" href="../CSS/main.css">
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
    * {
font-family: 'SUIT';
}
	body {
		background-color: white;
	}

		h5 {
		    text-align: center;
		    color: #01D281;
		    font-weight: 400;
		    font-size: 17px;
		}
		
		table {
		  border-collapse: collapse;
		  border-spacing: 0;
		}
		section.notice {
		  padding: 80px 0;
		}
		
		.page-title {
		  margin-bottom: 60px;
		}
		.page-title h3 {
		  font-size: 40px;
		  color: black;
		  font-weight: 800;
		  text-align: center;
		}
		
		#board-search .search-window {
		  padding: 15px 0;
		  
		}
		#board-search .search-window .search-wrap {
		  position: relative;
		/*   padding-right: 124px; */
		  margin: 0 auto;
		  width: 80%;
		  max-width: 564px;
		}
		#board-search .search-window .search-wrap input {
		  height: 40px;
		  width: 81%;
		  font-size: 14px;
		  padding: 7px 14px;
		  border: 1px solid #ccc;
		}
		#board-search .search-window .search-wrap input:focus {
		  border-color: #01D281;
		  outline: 0;
		  border-width: 1px;
		}
		#board-search .search-window .search-wrap .btn {
		  position: absolute;
		  right: 0;
		  top: 0;
		  bottom: 0;
		  width: 108px;
		  padding: 0;
		  font-size: 16px;
		}
		
		.board-table {
		  font-size: 15px;
		  width: 100%;
		  border-top: 1px solid #ccc;
		  border-bottom: 1px solid #ccc;
		}
		
		.board-table a {
		  color: #333;
		  display: inline-block;
		  line-height: 1.4;
		  word-break: break-all;
		  vertical-align: middle;
		}
		.board-table a:hover {
		  text-decoration: underline;
		  text-decoration-color: #01D281;
		  color: #01D281;
		}
		.board-table th {
		  text-align: center;
		}
		
		.board-table .th-num {
		  width: 100px;
		  text-align: center;
		}
		
		.board-table .th-date {
		  width: 200px;
		}
		
		.board-table .th-writer{
		
		}
		
		.board-table th, .board-table td {
		  padding: 14px 0;
		}
		
		.board-table tbody td {
		  border-top: 1px solid #e7e7e7;
		  text-align: center;
		}
		
		.board-table tbody th {
		  padding-left: 28px;
		  padding-right: 14px;
		  border-top: 1px solid #e7e7e7;
		  text-align: left;
		}
		
		.board-table tbody th p{
		  display: none;
		}
		
		.btn {
		  display: inline-block;
		  padding: 0 30px;
		  font-size: 15px;
		  font-weight: 400;
		  background: transparent;
		  text-align: center;
		  white-space: nowrap;
		  vertical-align: middle;
		  -ms-touch-action: manipulation;
		  touch-action: manipulation;
		  cursor: pointer;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
		  border: 1px solid transparent;
		  text-transform: uppercase;
		  -webkit-border-radius: 0;
		  -moz-border-radius: 0;
		  border-radius: 0;
		  -webkit-transition: all 0.3s;
		  -moz-transition: all 0.3s;
		  -ms-transition: all 0.3s;
		  -o-transition: all 0.3s;
		  transition: all 0.3s;
		}
		

		
		.btn-dark {
		  background: #555;
		  color: white;
		}
		
		.btn-dark:hover, .btn-dark:focus {
		  background: #01D281;
		  border-color: #01D281;
		  color: #fff;
		}
		
		thead{
		    
		}
		
		/* reset */
		
		* {
		  list-style: none;
		  text-decoration: none;
		  padding: 0;
		  margin: 0;
		  box-sizing: border-box;
		}
		.clearfix:after {
		  content: '';
		  display: block;
		  clear: both;
		}
		.container5 {
		  width: 1100px;
		  margin: 0 auto;
		}
		.blind {
		  position: absolute;
		  overflow: hidden;
		  clip: rect(0 0 0 0);
		  margin: -1px;
		  width: 1px;
		  height: 1px;
		}

        .btn-success {
            background: #555;
		  color: white; /* 글 작성 버튼 색상 */
        }
        
        .btn-success:hover {
          background: #01D281;
		  border-color: #01D281;
		  color: #fff; /* 글 작성 버튼 호버 색상 */
        }
        
        .button-container {
            display: flex; 
            justify-content: flex-end; /* 오른쪽 정렬 */
            gap: 10px; /* 버튼 간격 */
            margin: 20px 0px; /* 상단 여백 및 좌우 여백 설정 */
            position: fixed; /* 고정 위치 */
            right: 30px; /* 오른쪽 여백 */
            bottom: 200px; /* 아래쪽 여백 */
            z-index: 1000; /* 다른 요소보다 위에 표시 */
        }
        
       	.btn-success {
		  height: 40px;
		  width: 80px;
		  padding: 0;
		  font-size: 16px;
		}
        .Picon {
			    height: 17px;  
		     
        }
        .btn btn-dark{
        left : 300px}
    </style>

</head>
<body>

	<% PotUsers member1 = (PotUsers)session.getAttribute("member"); %>
	
<header></header>




	<% PotUsers member = (PotUsers)session.getAttribute("member");
	
		SnsDAO dao = new SnsDAO();
		List<PotSns> list = dao.getList();
		
		// 페이지당 게시물 수
	    int pageSize = 24; // 게시물 수를 24로 변경
	    // 현재 페이지 번호
	    int currentPage = 1; // 기본적으로 첫 페이지
	    if (request.getParameter("page") != null) {
	        currentPage = Integer.parseInt(request.getParameter("page"));
	    }
	    
	    // 시작 인덱스 계산
	    int startIndex = (currentPage - 1) * pageSize;
	    int endIndex = Math.min(startIndex + pageSize, list.size());
	    
	 // 현재 페이지에 해당하는 게시물 리스트 생성
	    List<PotSns> pagedList = new ArrayList<>(list.subList(startIndex, endIndex));
	    int totalPages = (int) Math.ceil((double) list.size() / pageSize); // 총 페이지 수
		
	
	%>
	
    <section class="notice">
        <div class="page-title">
              <div class="container12">
                  <h3>식집사 커뮤니티</h3><br>
                  <h5>POTPOT 커뮤니티에 합류하세요!</h5>
              </div>
          </div>
      
          <!-- board seach area -->
          <div id="board-search">
              <div class="container5">
                  <div class="search-window">
                      <form action="">
                          <div class="search-wrap">
                              <label for="search" class="blind">커뮤니티 검색</label>
                              <input id="search" type="search" name="" placeholder="식물 이름을 검색, 가드닝 노하우를 찾아보세요.">
                              <button type="submit" class="btn btn-dark">검색</button>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
         
        <!-- board list area -->
          <div id="board-list">
              <div class="container">
                  <table class="board-table">
                      <thead>
                      <tr>
                          <th scope="col" class="th-num">번호</th>
                          <th scope="col" class="th-title">제목</th>
                          <th scope="col" class="th-writer"><i class="fa-solid fa-user"></i></th>
                          <th scope="col" class="th-date">등록일</th>
                          <th scope="col" class="th-likes" ><i class="fa-solid fa-seedling"></i></th>
                          <th scope="col" class="th-date">조회수</th>
                      </tr>
                      </thead>

                      <tbody>
                       <% for (PotSns m : pagedList) { %>
                      <tr>
                          <td><%= m.getSns_idx() %></td>
                          <th>
                          	<%if(m.getSns_img()==null) {%>
                            <a href="snsview.jsp?sns_idx=<%=m.getSns_idx()%>"><%=m.getSns_title() %></a>
                            <%}else{ %>
                            <a href="snsview.jsp?sns_idx=<%=m.getSns_idx()%>"><%=m.getSns_title() %>
                            <img src="../img/Picon.png" class="Picon"></a>
                            <%} %>
                            
                            
                          </th>
                          <!-- 유저네임 -->
                          <td><%=m.getUser_nick() %></td>
                          <td><%=m.getCreated_at() %></td>
                          <!-- 좋아요수 -->
                          <td><%=m.getSns_likes() %></td>
                          <!-- 조회수 -->
                          <td><%=m.getSns_views() %></td>
                      </tr>
      					<%} %>
                      
                      </tbody>
                  </table>
              </div>
          </div>
      
      </section>
      
      <!-- 버튼 컨테이너 추가 -->
<% if(member == null) { %>

<% }else { %>
<div class="button-container">
    <button class="btn btn-success" onclick="location.href='sns_write.jsp'">글 작성</button>
</div>
<% } %>

<footer></footer>

</body>
</html>