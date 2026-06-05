/* func_ov002_0220cd40: 2 when busy (func_ov002_02207f24), else 1 iff the 2-bit
 * state field (bits 12..13 of +2) is 0. */
#include "ov002_core.h"
extern int func_ov002_02207f24(void *a);
int func_ov002_0220cd40(void *arg0) {
    if (func_ov002_02207f24(arg0) != 0) return 2;
    return ((unsigned)(*(u16 *)((char *)arg0 + 2) << 18) >> 30) == 0;
}
