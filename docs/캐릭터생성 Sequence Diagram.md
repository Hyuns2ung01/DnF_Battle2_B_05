```mermaid
sequenceDiagram
    autonumber
    actor 플레이어 as 플레이어
    participant UI as Create_Character_UI
    participant 전투 as 전투
    participant 플체크 as 플레이어체크

    플레이어->>UI: 캐릭터 생성 버튼 클릭 (동기 요청)
    activate UI
    UI->>전투: 캐릭터생성(플레이어id, 캐릭터명, 직업, 레벨)
    activate 전투

    전투->>플체크: 플레이어체크(플레이어id)
    activate 플체크
    플체크-->>전투: 인증 결과 반환 (true / false)
    deactivate 플체크

    alt 플레이어id == "hero" (인증 성공)
        전투->>전투: 전사 스탯 설정 (HP=레벨*100, 공격력=레벨*15)
        전투->>전투: 마법사 스탯 설정 (HP=레벨*60, 공격=레벨*25)
        전투-->>UI: 생성된 캐릭터 객체 반환
        UI-->>플레이어: 캐릭터 생성 성공 화면 출력 (Response 완료)
    else 인증 실패
        전투-->>UI: return -1
        UI-->>플레이어: 에러 메시지 팝업 출력 (Response 완료)
    end

    deactivate 전투
    deactivate UI
```
