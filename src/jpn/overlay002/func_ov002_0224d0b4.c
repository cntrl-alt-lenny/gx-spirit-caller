/* func_ov002_0224d0b4: kind-11 post gated by func_0202e204 of the idx card. */
#include "ov002_core.h"
extern int func_0202e204(int a);
void func_ov002_0224d0b4(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + idx * 4 + 288))->id;
    if (func_0202e204(id) == 0)
        return;
    func_ov002_02253370(player, 11, idx);
}
