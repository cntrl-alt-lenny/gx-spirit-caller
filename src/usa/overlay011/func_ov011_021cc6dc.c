/* func_ov011_021cc6dc: scale arg0 by 0xFF and feed it through 020b3870 with a
 * mode-derived shift (0x400 << (12 + (arg1==1))), then a second 020b3870 with
 * a count of 3 (arg1==0) or 1. */
#include "ov011_core.h"
extern int func_020b377c(int a, int b);
void func_ov011_021cc6dc(int arg0, int arg1) {
    int v4 = 1;
    if (arg1 == 0) v4 = 3;
    func_020b377c(func_020b377c(arg0 * 0xFF, 0x400 << (((arg1 == 1) ? 1 : 0) + 0xC)), v4);
}
