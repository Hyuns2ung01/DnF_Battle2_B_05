package dnf;

public class 전사 extends 캐릭터 {

    public 전사(String 캐릭터명, int 레벨) {
        super(캐릭터명, 레벨, 레벨 * 100, 레벨 * 15);
    }

    @Override
    public double 스킬발동() {
        // 검 휘두르기! → 데미지 = 공격력 × 1.5
        return get공격력() * 1.5;
    }
}
