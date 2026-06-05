/* func_ov002_0228a888: 1 iff arg1 exists and its player flag differs from arg0's. */
#include "ov002_core.h"
int func_ov002_0228a888(struct Ov002Self *arg0, struct Ov002Self *arg1) {
    if (arg1 == 0) return 0;
    return arg1->b0 != arg0->b0;
}
