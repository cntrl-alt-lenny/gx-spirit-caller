/* func_ov002_0225306c: kind-11 post if the idx card maps nonzero and
 * func_0202ed3c holds. */
#include "ov002_core.h"
extern int func_0202e1e0(int a);
extern int func_0202ed3c(int a);
void func_ov002_0225306c(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + idx * 4 + 288))->id;
    if (func_0202e1e0(id) == 0)
        return;
    if (func_0202ed3c(id) == 0)
        return;
    func_ov002_02253370(player, 11, idx);
}
