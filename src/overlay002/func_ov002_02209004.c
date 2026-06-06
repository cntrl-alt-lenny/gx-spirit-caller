/* func_ov002_02209004: 0 if the opponent's cf178 phase is 0; else 1 iff it is
 * <= 3. */
#include "ov002_core.h"
int func_ov002_02209004(struct Ov002Self *arg0) {
    int v = *(int *)(data_ov002_022cf178 + ((1 - arg0->b0) & 1) * 0x868);
    int r = 0;
    if (v == 0) return r;
    if ((unsigned)v <= 3) r = 1;
    return r;
}
