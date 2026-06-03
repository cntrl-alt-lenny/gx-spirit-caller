#include "ov005_core.h"
void func_ov005_021ab32c(int *o, int idx, int v) {
    unsigned short *p = (unsigned short *)o[4];   /* o->f16 */
    p[idx] |= v;
    o[6] = (o[6] & ~1) | 1;                        /* o->f24 set bit0 */
}
