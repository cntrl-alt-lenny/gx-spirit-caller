/* func_ov002_021c3c10: sequential guard chain over func_ov002_021bad9c /
 * func_ov002_021baf88, gated by the opponent index and D016C's rand_state. */
#include "ov002_core.h"

extern int func_ov002_021bad9c(int player, int code, int arg);
extern int func_ov002_021baf88(int code);

int func_ov002_021c3c10(int player) {
    int other = 1 - player;

    if (func_ov002_021bad9c(other, 0x137b, -1) != 0)
        return 1;
    if (func_ov002_021baf88(0x1340) != 0)
        return 1;
    if (func_ov002_021bad9c(other, 0x17e7, -1) != 0)
        return 1;
    if (player == D016C->f_cec) {
        if (func_ov002_021baf88(0x135e) != 0)
            return 1;
    }
    return 0;
}
