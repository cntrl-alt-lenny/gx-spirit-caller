#include "ov005_core.h"
int func_ov005_021b1000(void) {
    volatile unsigned *g = (volatile unsigned *)0x04001000;
    unsigned f = (g[0] & 0x1f00) >> 8;
    g[0] = (g[0] & ~0x1f00) | ((f & ~3) << 8);
    g[4] = 0;
    g[5] = 0;
    return 1;
}
