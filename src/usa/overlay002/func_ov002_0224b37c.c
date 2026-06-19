/* func_ov002_0224b37c: if player's cf17c list is non-empty, post a kind-13
 * entry to the func_ov002_02253370 list sink. */
#include "ov002_core.h"
void func_ov002_0224b37c(int player) {
    if (*(int *)((char *)data_ov002_022cf09c + (player & 1) * 0x868) == 0)
        return;
    func_ov002_02253370(player, 13, 0);
}
