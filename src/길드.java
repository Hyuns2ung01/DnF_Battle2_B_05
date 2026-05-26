package dnf;

import java.util.ArrayList;
import java.util.List;

public class 길드 {
    private String 길드명;
    private List<캐릭터> 캐릭터리스트 = new ArrayList<>();
    private int 최대인원 = 5;

    public 길드(String 길드명, 캐릭터 길드장) {
        this.길드명 = 길드명;
        this.캐릭터리스트.add(길드장);
    }

    public boolean 캐릭터가입(캐릭터 character) {
        if (캐릭터리스트.size() >= 최대인원) {
            return false;
        }
        캐릭터리스트.add(character);
        return true;
    }

    public String get길드명() { return 길드명; }
    public List<캐릭터> get캐릭터리스트() { return 캐릭터리스트; }
    public int get최대인원() { return 최대인원; }
}
