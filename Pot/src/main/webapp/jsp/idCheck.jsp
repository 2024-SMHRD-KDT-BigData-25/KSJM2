<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POTPOT: 아이디 중복 확인</title>

<script type="text/javascript" src="../member.js"></script>	
<link rel="stylesheet" href="../CSS/idCheck.css"/>
</head>


<body>

<h1>아이디 중복확인</h1>

<div class="content">

    <form action="idCheckCon" method="get" name="frm">

       
            <input id="checkbox" type="text" name="user_id" value="${user_id}">
            <p><input id="checkbtn" type="submit" value="중복 체크"></p>
        
       
        
        <br>
        
        <c:if test="${res==1}">
        <script type="text/javascript">
        opener.document.frm.user_id.value="";
        </script>


        ${user_id}는 이미 사용 중인 아이디 입니다.
        
        </c:if>

		<div class="canid">
        <c:if test="${res==0}">
        ${user_id}는 사용 가능한 아이디 입니다!
        </div>
        <br>
            
                <input type="button" value="사용하기!" class="cancel" onclick="idok()">
            
        
        </c:if>
        
    </form>
</div>




</body>
</html>