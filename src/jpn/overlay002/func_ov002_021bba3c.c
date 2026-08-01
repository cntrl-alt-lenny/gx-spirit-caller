/* func_ov002_021bba3c: scan sub-rows i=5..10 of arg0's per-player row; for
 * each where func_ov002_021b9dec(arg0,i) matches arg1 and a bit6/bit(1|2)
 * masked flags halfword is nonzero, count the sub-row if its +0x3c word is
 * >= arg2 (unsigned). Returns the count. */
#include "ov002_core.h"

extern int func_ov002_021b9dec(int a, int b);

int func_ov002_021bba3c(int arg0, int arg1, int arg2) {
    int i;
    int count = 0;
    char *p = data_ov002_022cf08c + (arg0 & 1) * 0x868 + 0x64;
    for (i = 5; i <= 10; i++, p += 0x14) {
        int r = func_ov002_021b9dec(arg0, i);
        if (r <= 0)
            continue;
        if (r != arg1)
            continue;
        unsigned int w = *(unsigned int *)(p + 0x40);
        unsigned int flags = *(unsigned short *)(p + 0x38);
        if (((flags & ~((w >> 6) & 1)) & ~(((w >> 1) | (w >> 2)) & 1)) == 0)
            continue;
        if ((unsigned int)*(int *)(p + 0x3c) >= (unsigned int)arg2)
            count++;
    }
    return count;
}
