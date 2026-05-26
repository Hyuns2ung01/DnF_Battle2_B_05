<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>던전앤파이터 - 캐릭터 생성</title>
</head>
<body>
    <h1>캐릭터 생성</h1>
    <form action="Create_Character_UI.jsp" method="post">
        <p>플레이어id: <input type="text" name="플레이어id" value="hero"></p>
        <p>캐릭터명: <input type="text" name="캐릭터명" value="용사"></p>
        <p>직업:
            <select name="직업">
                <option value="전사">전사</option>
                <option value="마법사">마법사</option>
            </select>
        </p>
        <p>레벨: <input type="number" name="레벨" value="1" min="1"></p>
        <input type="submit" value="캐릭터 생성">
    </form>
</body>
</html>
