```mermaid

sequenceDiagram

&#x20;   autonumber

&#x20;   actor Player as 플레이어

&#x20;   participant UI as Add\_Item\_UI

&#x20;   participant Ctrl as 전투

&#x20;   participant PClass as 플레이어

&#x20;   participant Char as 캐릭터

&#x20;   participant Inv as 인벤토리

&#x20;   participant Item as 아이템



&#x20;   Player ->> UI: 아이템 획득 요청(플레이어id, 아이템명, 타입, 가치)

&#x20;   UI ->> Ctrl: 아이템획득(플레이어id, 캐릭터, 아이템명, 타입, 가치)

&#x20;   Ctrl ->> PClass: 플레이어체크(플레이어id)



&#x20;   alt 플레이어id == "hero" (인증 성공)

&#x20;       PClass -->> Ctrl: true

&#x20;       Ctrl ->> Char: 인벤토리 참조 요청

&#x20;       Char -->> Ctrl: 인벤토리 객체 리턴

&#x20;       

&#x20;       Note over Ctrl: 아이템 가치에 따른 등급 판별

&#x20;       alt 가치 >= 1000

&#x20;           Note over Ctrl: 등급 = "전설(Legendary)"

&#x20;       else 가치 >= 500

&#x20;           Note over Ctrl: 등급 = "희귀(Rare)"

&#x20;       else 가치 < 500

&#x20;           Note over Ctrl: 등급 = "일반(Common)"

&#x20;       end

&#x20;       

&#x20;       Ctrl ->> Item: 아이템 객체 생성(아이템명, 타입, 가치, 등급)

&#x20;       Item -->> Ctrl: 생성된 아이템 객체 반환

&#x20;       

&#x20;       Ctrl ->> Inv: 아이템추가(아이템)

&#x20;       

&#x20;       alt 인벤토리 아이템리스트 크기 < 10 (여유 공간 있음)

&#x20;           Inv -->> Ctrl: true (추가 성공)

&#x20;           Ctrl -->> UI: "아이템 획득 성공" String 리턴

&#x20;           UI -->> Player: "아이템 획득 완료! \[등급: 전설]" 출력

&#x20;       else 인벤토리 아이템리스트 크기 >= 10 (가득 참)

&#x20;           Inv -->> Ctrl: false (추가 실패)

&#x20;           Ctrl -->> UI: "인벤토리 가득 참" String 리턴

&#x20;           UI -->> Player: "인벤토리가 가득 차서 아이템을 획득할 수 없습니다." 출력

&#x20;       end



&#x20;   else 플레이어id != "hero" (인증 실패)

&#x20;       PClass -->> Ctrl: false

&#x20;       Ctrl -->> UI: "인증 실패" 리턴

&#x20;       UI -->> Player: "권한이 없습니다." 출력

&#x20;   end

