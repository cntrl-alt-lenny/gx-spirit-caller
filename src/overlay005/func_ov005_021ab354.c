#include "ov005_core.h"
void func_ov005_021ab354(int *o, int idx, int v) {
    unsigned short *p = (unsigned short *)o[4];
    p[idx] &= ~v;
    o[6] = (o[6] & ~1) | 1;
}
