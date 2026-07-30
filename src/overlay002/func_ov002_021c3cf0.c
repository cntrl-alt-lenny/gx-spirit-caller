/* func_ov002_021c3cf0: sequential guard chain over func_ov002_021bae7c /
 * func_ov002_021bb068, gated by the opponent index and D016C's rand_state. */
#include "ov002_core.h"

extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021bb068(int code);

int func_ov002_021c3cf0(int player) {
    int other = 1 - player;

    if (func_ov002_021bae7c(other, 0x137b, -1) != 0)
        return 1;
    if (func_ov002_021bb068(0x1340) != 0)
        return 1;
    if (func_ov002_021bae7c(other, 0x17e7, -1) != 0)
        return 1;
    if (player == D016C->f_cec) {
        if (func_ov002_021bb068(0x135e) != 0)
            return 1;
    }
    return 0;
}
