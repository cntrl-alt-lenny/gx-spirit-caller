/* func_ov002_0224f74c: if the player's idx card maps (func_0202e234) to a
 * nonzero type, post a kind-11 entry to func_ov002_02253458. */
#include "ov002_core.h"
extern int func_0202e234(int a);
void func_ov002_0224f74c(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + idx * 4 + 288))->id;
    if (func_0202e234(id) == 0)
        return;
    func_ov002_02253458(player, 11, idx);
}
