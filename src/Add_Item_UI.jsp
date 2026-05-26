<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dnf.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String submitted = request.getParameter("submitted");
    String result = null;

    if ("true".equals(submitted)) {
        전투 battle = (전투) session.getAttribute("battle");
        캐릭터 character = (캐릭터) session.getAttribute("character");
        String 플레이어id = (String) session.getAttribute("플레이어id");

        String 아이템명 = request.getParameter("아이템명");
        String 타입 = request.getParameter("타입");
        int 가치 = Integer.parseInt(request.getParameter("가치"));

        if (battle != null && character != null) {
            String raw = battle.아이템획득(플레이어id, character, 아이템명, 타입, 가치);
            result = "인증 실패".equals(raw) ? "권한이 없습니다." : raw;
        } else {
            result = "캐릭터가 존재하지 않습니다. 먼저 캐릭터를 생성하세요.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이템 획득</title>
</head>
<body>
    <h1>아이템 획득</h1>
    <form action="Add_Item_UI.jsp" method="post">
        <input type="hidden" name="submitted" value="true">
        <p>아이템명: <input type="text" name="아이템명" value="엑스칼리버"></p>
        <p>타입:
            <select name="타입">
                <option value="무기">무기</option>
                <option value="방어구">방어구</option>
                <option value="물약">물약</option>
            </select>
        </p>
        <p>가치: <input type="number" name="가치" value="1500" min="0"></p>
        <input type="submit" value="아이템 획득">
    </form>
    <% if (result != null) { %>
        <h2>결과</h2>
        <p><%= result %></p>
    <% } %>
    <p><a href="index.jsp">처음으로</a></p>
</body>
</html>
