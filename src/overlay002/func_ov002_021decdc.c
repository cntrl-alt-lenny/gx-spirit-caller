/* func_ov002_021decdc: test bit (arg2 + arg1*16) of arg0's type-14 mask while its
 * +0 word is temporarily zeroed (restored after). */
#include "ov002_core.h"
extern int func_ov002_021de134(int a, int mask, int c, int d);
int func_ov002_021decdc(void *arg0, int arg1, int arg2) {
    int mask = 1 << (arg2 + arg1 * 16);
    u16 saved = *(u16 *)arg0;
    int r;
    *(u16 *)arg0 = 0;
    r = (func_ov002_021de134((int)arg0, mask, 14, 0) & mask) != 0;
    *(u16 *)arg0 = saved;
    return r;
}
