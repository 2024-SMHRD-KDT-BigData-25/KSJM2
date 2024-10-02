<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POTPOT: 아이디 중복 확인</title>

<script type="text/javascript" src="member.js"></script>


</head>
<body>

<h2>아이디 중복확인</h2>

<form action="idCheckCon" method="get" name="frm">

<input type="text" name="user_id" value="${id}">
<input type="submit" value="중복 체크">

<br>

<c:if test="${res==1}">
<script type="text/javascript">
opener.document.frm.user_id.value="";
</script>
${user_id}는 이미 사용 중인 아이디 입니다.

</c:if>
<c:if test="${res==0}">
${user_id}는 사용 가능한 아이디 입니다.

<input type="button" value="사용" class="cancel" onclick="idok()">

</c:if>

</form>


</body>
</html>