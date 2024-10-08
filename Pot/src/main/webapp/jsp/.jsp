<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POTPOT</title>
	<link rel="stylesheet" href="../CSS/main.css">

</head>
<body>
	<% PotUsers member = (PotUsers)session.getAttribute("member"); %>
<header>


    <a class="logo" href="../jsp/main.jsp">
        <img src="../img/potpot3.png" height="70px">
      </a>
      <nav>
        <ul class="nav-items">
          <li><a href="salelist.jsp">식물마켓</a></li>
          <li><a href="#식물찾기">식물찾기</a></li>
          <li><a href="snslist.jsp">커뮤니티</a></li>
          <% if(member == null) { %>
          <li ><a href="../html/Join_Login.html"><img class="img" src="../img/join1.png" height="10px"></a></li>
          <% }else { %>
          <li ><a href="mypage.jsp"><img class="img" src="../img/join.png" height="10px"></a></li>
          <% } %>
        </ul>
        
          
      
      </nav>
</header>

                 



	
	
	
<footer>
	<div class="footerdiv" style="display: flex">
		<img class="logo2" src="../img/potpot4.png" align="left">

		<a class="text2" align="left">This home page is plant <br>second hand trading site</a>
	</div>
	<div class="footerdiv2" style="display: flex">
			<img class="instergram" src="../img/instergram.png">
			<img class="discord" src="../img/discod.png">
			<img class="twitter" src="../img/twitter.png">
	</div>
	
</footer>

</body>
</html>