<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

        footer {
            background-color: #01D281;
            color: white;
            text-align: center;
            padding: 10px;
            width: 100%;
            bottom: 0;
            display: flex;
    justify-content: space-between;
    align-items: center;
        }
        
        .footerdiv {
         flex-flow: column wrap;
         align-content: flex-start;
         /*   width: 150px;*/
      }
      
      .logo2 {
         display: inline-block;
         height: 70px;
         width: 130px;
         margin-top: 20px;
         margin-left: 20px;
      }
      
      .text2 {
          display: inline-block;
         margin-left: 30px;
         margin-top : 1px;
         text-align: bottom;
         text-align: left;
         font-size: 10px;
         color: gray
      }
      
      .instergram {
         height: 20px;
         margin-right: 10px;
         margin-top: 1px;
      }
      .discord {
         height: 35px;
         padding-bottom: 10px;
         margin-right: 10px;
      }
      .twitter {
         height: 25px;
         margin-right: 10px;
      }
      
      .footerdiv2 {
         justify-content: flex-end;
         align-items: flex-start;
      }
      


</style>




</head>
<body>
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