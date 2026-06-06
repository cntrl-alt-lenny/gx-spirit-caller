/* func_ov002_0221292c: 2048 iff arg0 matches the active self's flag and arg1 is
 * 11; else 0. */
#include "ov002_core.h"
int func_ov002_0221292c(int arg0, int arg1) {
    struct Ov002Self *p = *(struct Ov002Self **)(data_ov002_022ce288 + 1164);
    if (arg0 == p->b0 && arg1 == 11) return 2048;
    return 0;
}
