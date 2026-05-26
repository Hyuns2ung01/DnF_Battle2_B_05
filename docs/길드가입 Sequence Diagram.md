```mermaid

sequenceDiagram

&#x20;   autonumber

&#x20;   actor Player as 플레이어

&#x20;   participant UI as Join\_Guild\_UI

&#x20;   participant Ctrl as 전투

&#x20;   participant PClass as 플레이어

&#x20;   participant Guild as 길드



&#x20;   Player ->> UI: 길드 가입 요청(플레이어id, 길드명)

&#x20;   UI ->> Ctrl: 길드가입(플레이어id, 캐릭터, 길드)

&#x20;   Ctrl ->> PClass: 플레이어체크(플레이어id)



&#x20;   alt 플레이어id == "hero" (인증 성공)

&#x20;       PClass -->> Ctrl: true

&#x20;       

&#x20;       Ctrl ->> Guild: 캐릭터가입(캐릭터)

&#x20;       

&#x20;       alt 길드 캐릭터리스트 크기 < 5 (정원 여유 있음)

&#x20;           Guild -->> Ctrl: true (가입 성공)

&#x20;           Ctrl -->> UI: "길드 가입 성공" String 리턴

&#x20;           UI -->> Player: "성공적으로 길드에 가입되었습니다!" 출력

&#x20;       else 길드 캐릭터리스트 크기 >= 5 (정원 초과)

&#x20;           Guild -->> Ctrl: false (가입 실패)

&#x20;           Ctrl -->> UI: "길드 정원 초과" String 리턴

&#x20;           UI -->> Player: "길드 정원이 가득 차서 가입할 수 없습니다." 출력

&#x20;       end



&#x20;   else 플레이어id != "hero" (인증 실패)

&#x20;       PClass -->> Ctrl: false

&#x20;       Ctrl -->> UI: "인증 실패" 리턴

&#x20;       UI -->> Player: "권한이 없습니다." 출력

&#x20;   end

