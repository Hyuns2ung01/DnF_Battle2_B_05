package dnf;

import java.util.ArrayList;
import java.util.List;

public class 인벤토리 {
    private List<아이템> 아이템리스트 = new ArrayList<>();
    private int 최대용량 = 10;

    public boolean 아이템추가(아이템 item) {
        if (아이템리스트.size() >= 최대용량) {
            return false;
        }
        아이템리스트.add(item);
        return true;
    }

    public List<아이템> get아이템리스트() { return 아이템리스트; }
    public int get최대용량() { return 최대용량; }
}
