/* func_ov002_021ded54: test bit (arg2 + arg1*16) of the mask returned by
 * func_ov002_021de134(arg0, mask, arg4, sameplayer?0:0x40000). */
#include "ov002_core.h"
extern int func_ov002_021de134(int a, int mask, int c, int d);
int func_ov002_021ded54(int arg0, int arg1, int arg2, int arg3, int arg4) {
    int mask = 1 << (arg2 + arg1 * 16);
    return (func_ov002_021de134(arg0, mask, arg4, arg1 != arg3 ? 262144 : 0) & mask) != 0;
}
