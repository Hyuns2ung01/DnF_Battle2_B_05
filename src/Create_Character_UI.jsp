<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dnf.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String 플레이어id = request.getParameter("플레이어id");
    String 캐릭터명  = request.getParameter("캐릭터명");
    String 직업      = request.getParameter("직업");
    int    레벨      = Integer.parseInt(request.getParameter("레벨"));

    전투 battle = new 전투();
    캐릭터 character = battle.캐릭터생성(플레이어id, 캐릭터명, 직업, 레벨);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캐릭터 생성 결과</title>
</head>
<body>
<% if (character != null) {
    session.setAttribute("battle", battle);
    session.setAttribute("character", character);
    session.setAttribute("직업", 직업);
%>
    <h1>캐릭터 생성 성공</h1>
    <ul>
        <li>캐릭터명: <%= character.get캐릭터명() %></li>
        <li>직업: <%= 직업 %></li>
        <li>레벨: <%= character.get레벨() %></li>
        <li>HP: <%= character.getHP() %></li>
        <li>공격력: <%= character.get공격력() %></li>
    </ul>
    <form action="Attack_Monster_UI.jsp" method="post">
        <input type="submit" value="몬스터 공격">
    </form>
    <p><a href="index.jsp">새 캐릭터 생성</a></p>
<% } else { %>
    <h1>캐릭터 생성 실패</h1>
    <p>플레이어체크 실패: 플레이어id는 "hero"여야 합니다.</p>
    <p><a href="index.jsp">돌아가기</a></p>
<% } %>
</body>
</html>
