/* func_ov002_0224cb6c: opponent variant of func_ov002_0224b37c — guard and
 * post against the other player (1 - player). */
#include "ov002_core.h"
void func_ov002_0224cb6c(int player) {
    int opp = 1 - player;
    if (*(int *)((char *)data_ov002_022cf09c + (opp & 1) * 0x868) == 0)
        return;
    func_ov002_02253370(opp, 13, 0);
}
