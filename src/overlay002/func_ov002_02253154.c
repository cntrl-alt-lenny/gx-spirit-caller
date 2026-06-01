/* func_ov002_02253154: kind-11 post if the idx card maps nonzero and
 * func_0202ed90 holds. */
#include "ov002_core.h"
extern int func_0202e234(int a);
extern int func_0202ed90(int a);
void func_ov002_02253154(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + idx * 4 + 288))->id;
    if (func_0202e234(id) == 0)
        return;
    if (func_0202ed90(id) == 0)
        return;
    func_ov002_02253458(player, 11, idx);
}
