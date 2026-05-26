package dnf;

public class 전투 {
    private 플레이어 player;

    // Use Case: 캐릭터생성
    public 캐릭터 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) {
        this.player = new 플레이어(플레이어id);

        // 반드시 플레이어체크
        if (!player.플레이어체크(플레이어id)) {
            return null;
        }

        // 직업에 따라 기본 능력치 다르게 설정
        if ("전사".equals(직업)) {
            return new 전사(캐릭터명, 레벨);
        }
        if ("마법사".equals(직업)) {
            return new 마법사(캐릭터명, 레벨);
        }
        return null;
    }

    // Use Case: 몬스터공격
    public String 몬스터공격(String 플레이어id, 캐릭터 character) {
        // 반드시 플레이어체크 (시퀀스 다이어그램: 전투->>플레이어체크(플레이어id))
        if (player == null || !player.플레이어체크(플레이어id)) {
            return "-1";
        }

        // 직업에 따라 스킬 다르게 발동
        double 데미지 = character.스킬발동();
        String 스킬명 = (character instanceof 전사) ? "검 휘두르기!" : "파이어볼!";

        // 데미지에 따라 등급 부여
        String 등급;
        if (데미지 >= 200) 등급 = "S";
        else if (데미지 >= 100) 등급 = "A";
        else 등급 = "B";

        return 스킬명 + " 데미지 = " + 데미지 + " → " + 등급 + "급 공격";
    }
}
