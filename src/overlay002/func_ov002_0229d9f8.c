/* func_ov002_0229d9f8: 1 iff arg1 is in the 8-wide window [base, base+8) where
 * base = arg0[168]; 0 below the window. */
#include "ov002_core.h"
int func_ov002_0229d9f8(void *arg0, int arg1) {
    int base = *(int *)((char *)arg0 + 168);
    if (arg1 < base) return 0;
    return arg1 < base + 8;
}
