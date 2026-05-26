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

        String 길드명 = request.getParameter("길드명");

        길드 guild = (길드) application.getAttribute("길드:" + 길드명);
        if (guild == null) {
            전사 길드장 = new 전사("길드장", 1);
            guild = new 길드(길드명, 길드장);
            application.setAttribute("길드:" + 길드명, guild);
        }

        if (battle != null && character != null) {
            result = battle.길드가입(플레이어id, character, guild);
        } else {
            result = "캐릭터가 존재하지 않습니다. 먼저 캐릭터를 생성하세요.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>길드 가입</title>
</head>
<body>
    <h1>길드 가입</h1>
    <form action="Join_Guild_UI.jsp" method="post">
        <input type="hidden" name="submitted" value="true">
        <p>길드명: <input type="text" name="길드명" value="불사조"></p>
        <input type="submit" value="길드 가입">
    </form>
    <% if (result != null) { %>
        <h2>결과</h2>
        <p><%= result %></p>
    <% } %>
    <p><a href="index.jsp">처음으로</a></p>
</body>
</html>
