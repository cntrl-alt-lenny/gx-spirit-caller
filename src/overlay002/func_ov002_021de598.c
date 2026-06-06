/* func_ov002_021de598: test bit (arg2 + arg1*16) of the type-(14,10) mask
 * (func_ov002_021de134); 0 when arg2 exceeds 10. */
#include "ov002_core.h"
extern int func_ov002_021de134(int a, int mask, int c, int d);
int func_ov002_021de598(int arg0, int arg1, int arg2) {
    int mask = 1 << (arg2 + arg1 * 16);
    if (arg2 > 10) return 0;
    return (func_ov002_021de134(arg0, mask, 14, 10) & mask) != 0;
}
