package dnf;

public class 전투 {
    private 플레이어 player;

    public 캐릭터 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) {
        this.player = new 플레이어(플레이어id);

        if (!player.플레이어체크(플레이어id)) {
            return null;
        }

        if ("전사".equals(직업)) {
            return new 전사(캐릭터명, 레벨);
        }
        if ("마법사".equals(직업)) {
            return new 마법사(캐릭터명, 레벨);
        }
        return null;
    }

    public String 몬스터공격(String 플레이어id, 캐릭터 character) {
        if (player == null || !player.플레이어체크(플레이어id)) {
            return "인증 실패";
        }

        double 데미지 = character.스킬발동();
        String 스킬명 = (character instanceof 전사) ? "검 휘두르기!" : "파이어볼!";

        String 등급;
        if (데미지 >= 200) 등급 = "S급";
        else if (데미지 >= 100) 등급 = "A급";
        else 등급 = "B급";

        return "[" + 스킬명 + "] 데미지 " + (int)데미지 + " (" + 등급 + ")";
    }

    public String 아이템획득(String 플레이어id, 캐릭터 character, String 아이템명, String 타입, int 가치) {
        if (player == null || !player.플레이어체크(플레이어id)) {
            return "인증 실패";
        }

        인벤토리 inv = character.get인벤토리();

        String 등급;
        if (가치 >= 1000) 등급 = "전설(Legendary)";
        else if (가치 >= 500) 등급 = "희귀(Rare)";
        else 등급 = "일반(Common)";

        아이템 item = new 아이템(아이템명, 타입, 가치, 등급);

        if (inv.아이템추가(item)) {
            return "아이템 획득 완료! [등급: " + 등급 + "]";
        }
        return "인벤토리가 가득 차서 아이템을 획득할 수 없습니다.";
    }

    public String 길드가입(String 플레이어id, 캐릭터 character, 길드 guild) {
        if (player == null || !player.플레이어체크(플레이어id)) {
            return "인증 실패";
        }

        if (guild.캐릭터가입(character)) {
            return "성공적으로 길드에 가입되었습니다!";
        }
        return "길드 정원이 가득 차서 가입할 수 없습니다.";
    }
}
