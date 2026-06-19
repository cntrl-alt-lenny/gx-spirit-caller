/* func_ov002_0220cc50: 2 when busy (func_ov002_02207e34), else 1 iff the 2-bit
 * state field (bits 12..13 of +2) is 0. */
#include "ov002_core.h"
extern int func_ov002_02207e34(void *a);
int func_ov002_0220cc50(void *arg0) {
    if (func_ov002_02207e34(arg0) != 0) return 2;
    return ((unsigned)(*(u16 *)((char *)arg0 + 2) << 18) >> 30) == 0;
}
