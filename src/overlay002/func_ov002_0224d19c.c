/* func_ov002_0224d19c: kind-11 post gated by func_0202e258 of the idx card. */
#include "ov002_core.h"
extern int func_0202e258(int a);
void func_ov002_0224d19c(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + idx * 4 + 288))->id;
    if (func_0202e258(id) == 0)
        return;
    func_ov002_02253458(player, 11, idx);
}
