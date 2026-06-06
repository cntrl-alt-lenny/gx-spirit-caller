/* func_ov002_022090b8: 0 unless the active player is arg0's opponent; then 1 iff
 * the phase (d016c+3320) is 2. */
#include "ov002_core.h"
int func_ov002_022090b8(struct Ov002Self *arg0) {
    if (*(int *)(data_ov002_022d016c + 3308) != 1 - arg0->b0) return 0;
    return *(int *)(data_ov002_022d016c + 3320) == 2;
}
