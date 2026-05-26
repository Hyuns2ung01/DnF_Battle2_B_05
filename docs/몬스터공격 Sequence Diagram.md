```mermaid
sequenceDiagram
    autonumber
    actor 플레이어 as 플레이어
    participant UI as Attack_Monster_UI
    participant 전투 as 전투
    participant 플체크 as 플레이어체크

    플레이어-)UI: 몬스터 공격 클릭 (비동기 이벤트 발생)
    activate UI
    
    UI-)전투: 몬스터공격 요청 전송 (Non-Blocking)
    activate 전투
    
    전투->>플체크: 플레이어체크(플레이어id)
    activate 플체크
    플체크-->>전투: 인증 결과 반환 (true / false) 
    deactivate 플체크

    alt 플레이어id == "hero" (인증 성공)
        전투->>전투: 전사 스킬 발동 (검 휘두르기! 데미지=공격력*1.5)
        전투->>전투: 마법사 스킬 발동 (파이어볼! 데미지=공격력*2.0)
        전투-->>UI: 공격 결과 데이터 반환
        UI-->>플레이어: 공격 결과 동적 반영
    else 인증 실패
        전투-->>UI: return -1
        UI-->>플레이어: 에러 메시지 동적 반영
    end
    
    deactivate 전투
    deactivate UI