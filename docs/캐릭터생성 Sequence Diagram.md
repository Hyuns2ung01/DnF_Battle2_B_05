```mermaid
sequenceDiagram
    autonumber
    actor Player as 플레이어
    participant UI as Create_Character_UI
    participant Ctrl as 전투
    participant PClass as 플레이어
    participant Char as 캐릭터 (추상)
    participant Inv as 인벤토리

    Player ->> UI: 캐릭터 생성 요청(플레이어id, 캐릭터명, 직업, 레벨)
    UI ->> Ctrl: 캐릭터생성(플레이어id, 캐릭터명, 직업, 레벨)
    Ctrl ->> PClass: 플레이어체크(플레이어id)
    
    alt 플레이어id == "hero" (인증 성공)
        PClass -->> Ctrl: true
        
        alt 직업 == "전사"
            Ctrl ->> Char: 전사 객체 생성(HP=레벨*100, 공격력=레벨*15)
            Char ->> Inv: 인벤토리 생성(최대용량=10)
            Inv -->> Char: 인벤토리 객체 주소 반환
            Char -->> Ctrl: 전사 캐릭터 객체 반환
        else 직업 == "마법사"
            Ctrl ->> Char: 마법사 객체 생성(HP=레벨*60, 공격력=레벨*25)
            Char ->> Inv: 인벤토리 생성(최대용량=10)
            Inv -->> Char: 인벤토리 객체 주소 반환
            Char -->> Ctrl: 마법사 캐릭터 객체 반환
        end
        
        Ctrl -->> UI: 캐릭터 객체 리턴
        UI -->> Player: 캐릭터 생성 완료 결과 출력
        
    else 플레이어id != "hero" (인증 실패)
        PClass -->> Ctrl: false
        Ctrl -->> UI: "인증 실패" 리턴
        UI -->> Player: "등록되지 않은 플레이어입니다." 출력
    end