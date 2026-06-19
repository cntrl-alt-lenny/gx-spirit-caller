/* func_ov010_021b38c0: if the scroll window isn't already at its last row, mark
 * it dirty (unk68=3, unk70=0x5000) and return 1; else 0. */
#include "ov010_core.h"
extern int func_020b377c(int a, int b);
int func_ov010_021b38c0(void *arg0) {
    char *p = arg0;
    int q;
    if (*(short *)(p + 108) == 0) q = 0;
    else q = func_020b377c(*(short *)(p + 90) - *(short *)(p + 86), *(short *)(p + 108));
    if (*(int *)(p + 92) == q - 1) return 0;
    *(int *)(p + 104) = 3;
    *(int *)(p + 112) = 20480;
    return 1;
}
