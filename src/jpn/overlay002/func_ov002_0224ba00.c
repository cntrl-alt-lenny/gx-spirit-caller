/* func_ov002_0224ba00: sibling of func_ov002_02249074 for type 2. */
#include "ov002_core.h"
extern int func_0202b824(int a);
extern int func_ov002_021ca360(int player, int id);
void func_ov002_0224ba00(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + idx * 4 + 288))->id;
    if (func_0202b824(id) != 2)
        return;
    if (func_ov002_021ca360(player, id) == 0)
        return;
    func_ov002_02253370(player, 11, idx);
}
