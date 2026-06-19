#include "ov005_core.h"
extern void func_0201eee8(int, void *, void *);
extern void func_020aad04(int, void *);
int func_ov005_021ad104(int *o) {
    int ret = 0;
    if (o[15]) {                                  /* +60 */
        func_0201eee8(o[12], &o[14], &o[15]);     /* +48, +56, +60 */
        o[16] = 0;                                /* +64 */
        o[15] = 0;
    }
    if (o[34]) {                                  /* +136 */
        func_020aad04(o[17], &o[18]);             /* +68, +72 */
        ret = 1;
    }
    *(volatile int *)0x04000000 &= ~0x1f00;
    *(volatile int *)0x04001000 &= ~0x1f00;
    return ret;
}
