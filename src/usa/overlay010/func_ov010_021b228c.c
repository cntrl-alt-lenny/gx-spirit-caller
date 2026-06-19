/* func_ov010_021b228c: if the scroll window's dirty bit (unk70 bit0) is set,
 * recompute unk68 = lo + v*(hi-lo)/span and clear the bit; return unk68. */
#include "ov010_core.h"
extern int func_020b377c(int a, int b);
int func_ov010_021b228c(void *arg0) {
    char *p = arg0;
    int span = *(short *)(p + 86) - *(short *)(p + 78);
    int v = *(int *)(p + 4);
    if (((unsigned)(*(int *)(p + 112) << 31) >> 31) == 1) {
        int hi = *(int *)(p + 92);
        int lo = *(int *)(p + 96);
        if (lo == hi) *(int *)(p + 104) = lo;
        else *(int *)(p + 104) = lo + func_020b377c(v * (hi - lo), span);
        *(int *)(p + 112) &= ~1;
    }
    return *(int *)(p + 104);
}
