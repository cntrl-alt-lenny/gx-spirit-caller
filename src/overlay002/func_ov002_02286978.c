/* func_ov002_02286978: 1 iff the active player does NOT own arg0's flag and the
 * phase (d016c+3320) is 5. */
#include "ov002_core.h"
int func_ov002_02286978(struct Ov002Self *arg0) {
    if (*(int *)(data_ov002_022d016c + 3308) != arg0->b0 &&
        *(int *)(data_ov002_022d016c + 3320) == 5)
        return 1;
    return 0;
}
