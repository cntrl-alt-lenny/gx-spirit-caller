/* func_ov002_0228a974: sibling of 0228a888 — player-flag mismatch test. */
#include "ov002_core.h"
int func_ov002_0228a974(struct Ov002Self *arg0, struct Ov002Self *arg1) {
    if (arg1 == 0) return 0;
    return arg1->b0 != arg0->b0;
}
