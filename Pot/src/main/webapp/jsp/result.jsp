<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이상형 월드컵</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
        }
        .image-container {
            margin: 20px 0;
        }
        img {
            max-width: 300px;
            height: auto;
            cursor: pointer;
            margin: 0 10px;
        }
    </style>
    <script>
        function submitForm(formId) {
            document.getElementById(formId).submit();
        }
    </script>
</head>
<body>
<%

	boardDAO dao = new boardDAO();
	List<myboard> list = dao.getList();
    // 로컬 이미지 파일 경로 배열 초기화
    String[] images = {
        "upload/" + list.get(0).getImg(), // 이미지 파일을 서버 내 /images 폴더에 저장
        "upload/" + list.get(1).getImg(),
        "upload/" + list.get(2).getImg(),
        "upload/" + list.get(3).getImg(),
        "upload/" + list.get(4).getImg(),
        "upload/" + list.get(5).getImg(),
        "upload/" + list.get(6).getImg(),
        "upload/" + list.get(7).getImg()
    };

    // 세션에서 현재 라운드의 이미지 목록을 가져오기
    List<String> currentImages = (List<String>) session.getAttribute("currentImages");
    if (currentImages == null) {
        currentImages = new ArrayList<>(Arrays.asList(images)); // 첫 라운드일 경우
        session.setAttribute("currentImages", currentImages);
    }

    // 현재 라운드 가져오기
    Integer round = (Integer) session.getAttribute("round");
    if (round == null) {
        round = 1; // 첫 라운드 시작
    }

    // 우승자 결정 후 페이지 새로고침
    if (currentImages.size() == 1) {
        out.println("<div class='container'><h1>우승자: <img src='" + currentImages.get(0) + "'></h1></div>");
        session.invalidate(); // 게임 종료 후 세션 초기화
        return;
    }

    // POST 요청 처리
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String selectedImage = request.getParameter("selected");

        // 다음 라운드에 사용할 이미지 저장
        List<String> nextRoundImages = (List<String>) session.getAttribute("nextRoundImages");
        if (nextRoundImages == null) {
            nextRoundImages = new ArrayList<>();
        }
        nextRoundImages.add(selectedImage); // 선택된 이미지 추가

        // 라운드가 끝났는지 확인
        if (nextRoundImages.size() == currentImages.size() / 2) {
            currentImages = nextRoundImages; // 다음 라운드로 이동
            session.setAttribute("currentImages", currentImages);
            session.setAttribute("nextRoundImages", null); // 다음 라운드 이미지 초기화
            session.setAttribute("usedIndexes", null); // **usedIndexes 초기화**
            round++; // 라운드 업데이트
        } else {
            session.setAttribute("nextRoundImages", nextRoundImages);
        }

        session.setAttribute("round", round);
        response.sendRedirect("worldcup.jsp"); // 리다이렉트로 새로고침
        return;
    }

    // 현재 라운드에서 중복된 이미지 선택 방지
    List<Integer> usedIndexes = (List<Integer>) session.getAttribute("usedIndexes");
    if (usedIndexes == null) {
        usedIndexes = new ArrayList<>();
        session.setAttribute("usedIndexes", usedIndexes);
    }

    Random rand = new Random();
    int index1 = -1, index2 = -1;

    // 남은 이미지만 사용해 두 개의 이미지를 랜덤 선택
    while (index1 == -1 || usedIndexes.contains(index1)) {
        index1 = rand.nextInt(currentImages.size());
    }
    usedIndexes.add(index1); // 선택한 이미지 인덱스 추가

    while (index2 == -1 || usedIndexes.contains(index2) || index1 == index2) {
        index2 = rand.nextInt(currentImages.size());
    }
    usedIndexes.add(index2); // 선택한 이미지 인덱스 추가

    // 사용한 인덱스를 세션에 저장
    session.setAttribute("usedIndexes", usedIndexes);

    String image1 = currentImages.get(index1);
    String image2 = currentImages.get(index2);
%>

<div class="container">
    <h1>
        <%
            // 라운드 별로 경기 이름 출력
            if (currentImages.size() == 2) {
                out.print("결승전");
            } else if (currentImages.size() <= 4) {
                out.print("4강");
            } else {
                out.print("8강");
            }
        %> - <%= round %> 라운드
    </h1>

    <div class="image-container">
        <form id="form1" action="worldcup.jsp" method="post" style="display: inline;">
            <input type="hidden" name="selected" value="<%= image1 %>">
            <img src="<%= image1 %>" alt="Image 1" onclick="submitForm('form1');">
        </form>
        <form id="form2" action="worldcup.jsp" method="post" style="display: inline;">
            <input type="hidden" name="selected" value="<%= image2 %>">
            <img src="<%= image2 %>" alt="Image 2" onclick="submitForm('form2');">
        </form>
    </div>
</div>

</body>
</html>
