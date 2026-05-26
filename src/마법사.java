package dnf;

public class 마법사 extends 캐릭터 {

    public 마법사(String 캐릭터명, int 레벨) {
        super(캐릭터명, 레벨, 레벨 * 60, 레벨 * 25);
    }

    @Override
    public double 스킬발동() {
        // 파이어볼! → 데미지 = 공격력 × 2.0
        return get공격력() * 2.0;
    }
}
