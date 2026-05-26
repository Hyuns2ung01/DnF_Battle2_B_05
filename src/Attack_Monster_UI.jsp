<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dnf.*" %>
<%
    전투 battle = (전투) session.getAttribute("battle");
    캐릭터 character = (캐릭터) session.getAttribute("character");

    String result;
    if (battle != null && character != null) {
        result = battle.몬스터공격(character);
    } else {
        result = "캐릭터가 존재하지 않습니다. 먼저 캐릭터를 생성하세요.";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>몬스터 공격 결과</title>
</head>
<body>
    <h1>몬스터 공격 결과</h1>
    <p><%= result %></p>
    <form action="Attack_Monster_UI.jsp" method="post">
        <input type="submit" value="다시 공격">
    </form>
    <p><a href="index.jsp">처음으로</a></p>
</body>
</html>
