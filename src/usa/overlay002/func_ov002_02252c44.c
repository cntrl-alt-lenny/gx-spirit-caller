/* func_ov002_02252c44: kind-11 post if func_0202e28c of the idx card holds and
 * func_ov002_021ca310 holds. */
#include "ov002_core.h"
extern int func_0202e28c(int a);
extern int func_ov002_021ca310(int player, int id);
void func_ov002_02252c44(int player, int arg1, int idx) {
    int id = ((struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + idx * 4 + 288))->id;
    if (func_0202e28c(id) == 0)
        return;
    if (func_ov002_021ca310(player, id) == 0)
        return;
    func_ov002_02253370(player, 11, idx);
}
