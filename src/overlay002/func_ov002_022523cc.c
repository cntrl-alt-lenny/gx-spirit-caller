/* func_ov002_022523cc: kind-11 post if func_0202eac8 of the idx card holds and
 * func_ov002_021ca440 holds. */
#include "ov002_core.h"
extern int func_0202eac8(int a);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_022523cc(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + idx * 4 + 288))->id;
    if (func_0202eac8(id) == 0)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 11, idx);
}
