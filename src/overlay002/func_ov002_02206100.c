/* func_ov002_02206100: 0 unless the active player (d016c+3308) owns arg0's flag;
 * then 1 iff the phase (d016c+3320) is 1. */
#include "ov002_core.h"
int func_ov002_02206100(struct Ov002Self *arg0) {
    if (*(int *)(data_ov002_022d016c + 3308) == arg0->b0) return 0;
    return *(int *)(data_ov002_022d016c + 3320) == 1;
}
