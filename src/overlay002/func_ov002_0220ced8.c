/* func_ov002_0220ced8: 1 iff the two row scalars (cf16c+0 / +2152) differ by at
 * least 8000 in either direction. */
#include "ov002_core.h"
int func_ov002_0220ced8(void) {
    int b = *(int *)(data_ov002_022cf16c + 2152);
    int a = *(int *)data_ov002_022cf16c;
    if (a - b >= 8000) return 1;
    return b - a >= 8000;
}
