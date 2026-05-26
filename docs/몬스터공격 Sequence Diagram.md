```mermaid
sequenceDiagram
    autonumber
    actor Player as 플레이어
    participant UI as Attack_Monster_UI
    participant Ctrl as 전투
    participant PClass as 플레이어
    participant Char as 캐릭터 (전사/마법사)

    Player ->> UI: 몬스터 공격 요청(플레이어id, 캐릭터 객체)
    UI ->> Ctrl: 몬스터공격(플레이어id, 캐릭터)
    Ctrl ->> PClass: 플레이어체크(플레이어id)

    alt 플레이어id == "hero" (인증 성공)
        PClass -->> Ctrl: true
        
        Ctrl ->> Char: 스킬발동()
        
        alt 전사 객체인 경우 (Dynamic Binding)
            Char -->> Ctrl: 데미지 반환 (공격력 * 1.5) / "검 휘두르기!"
        else 마법사 객체인 경우 (Dynamic Binding)
            Char -->> Ctrl: 데미지 반환 (공격력 * 2.0) / "파이어볼!"
        end
        
        alt 데미지 >= 200
            Note over Ctrl: 등급 = "S급"
        else 데미지 >= 100
            Note over Ctrl: 등급 = "A급"
        else 데미지 < 100
            Note over Ctrl: 등급 = "B급"
        end
        
        Ctrl -->> UI: 처리 결과 String 리턴 (스킬명, 데미지, 등급 정보 포함)
        UI -->> Player: 공격 결과 화면 출력 (출력값 예: "[검 휘두르기!] 데미지 225 (S급)")
        
    else 플레이어id != "hero" (인증 실패)
        PClass -->> Ctrl: false
        Ctrl -->> UI: "인증 실패" 리턴
        UI -->> Player: "공격 권한이 없습니다." 에러 출력
    end