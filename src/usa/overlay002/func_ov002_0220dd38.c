/* func_ov002_0220dd38: 0 when the slot kind (bits 6..11 of +2) is 35; else 1 iff
 * func_ov002_022576f4 returns 3. */
#include "ov002_core.h"
extern int func_ov002_022576f4(void *a);
int func_ov002_0220dd38(void *arg0) {
    int k = (unsigned)(*(u16 *)((char *)arg0 + 2) << 20) >> 26;
    if (k == 35) return 0;
    return func_ov002_022576f4(arg0) == 3;
}
