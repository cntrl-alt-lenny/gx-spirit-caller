/* func_ov002_0220b650: 0 if the active player (cd3f4+0) owns arg0's flag; else 1
 * iff that player differs from cd3f4+4. */
#include "ov002_core.h"
int func_ov002_0220b650(struct Ov002Self *arg0) {
    int v = *(int *)data_ov002_022cd314;
    if (v == arg0->b0) return 0;
    return v != *(int *)(data_ov002_022cd314 + 4);
}
