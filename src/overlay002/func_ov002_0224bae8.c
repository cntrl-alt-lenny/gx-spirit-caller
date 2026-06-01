/* func_ov002_0224bae8: sibling of func_ov002_0224915c for type 2. */
#include "ov002_core.h"
extern int func_0202b878(int a);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_0224bae8(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + idx * 4 + 288))->id;
    if (func_0202b878(id) != 2)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 11, idx);
}
