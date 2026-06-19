/* func_ov002_021e7494: if bit arg2 of the slot's u16 mask (arg0[arg1*2+8]) is
 * set, return 0; else delegate to func_ov002_02257564. */
#include "ov002_core.h"
extern int func_ov002_02257564(void *a, int b, int c);
int func_ov002_021e7494(void *arg0, int arg1, int arg2) {
    if (*(u16 *)((char *)arg0 + arg1 * 2 + 8) & (1 << arg2)) return 0;
    return func_ov002_02257564(arg0, arg1, arg2);
}
