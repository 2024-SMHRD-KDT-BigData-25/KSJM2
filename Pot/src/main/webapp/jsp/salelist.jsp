<%@page import="com.smhrd.model.PotSale"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.SaleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// DAO -> 전체 게시물 정보를 가져오는 기능
		SaleDAO dao = new SaleDAO();
		List<PotSale> list = dao.getList();
		System.out.println(list.size());
	%>
	
	
 <div class="panel-heading">게시판</div>
<div class="panel-body">
    	  <table class="table table-bordered">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성일</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<% for(PotSale m:list) {%>
		      		<tr>
		        		<td><%=m.getSale_idx() %></td>
		        		<td><a href="../jsp/salecontent.jsp?sale_idx=<%= m.getSale_idx() %>"><%=m.getSale_title() %></a></td>
		        		<td><%=m.getUser_id() %></td>
		        		<td><%=m.getCreated_at() %></td>
		      		</tr>
		      	<% } %>
		      <tr>
		      	<td colspan="4">
		      		<button class="btn btn-sm btn-success" onclick="location.href='../jsp/sale_write.jsp'">글작성</button>
		      		<button class="btn btn-sm btn-warning" onclick="window.open('', '채팅방', 'width=500, height=700, top=50, left=500')">채팅하기</button>
		      	</td>
		      </tr>
		    </tbody>
		  </table>
    </div>

</body>
</html>