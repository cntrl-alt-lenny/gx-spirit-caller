/* func_ov002_0226c584: gate on arg1+arg2<=4 and
 * func_ov002_021bc8c8(D016C.f_cec,arg0,sum)!=0; return 0x800 iff the u16
 * at data_ov002_022cf1a4 (player=arg0&1, stride 0x868, +sum*20) is
 * nonzero, else 0. */
#include "ov002_core.h"
extern int func_ov002_021bc8c8(int a, int arg0, int b);

int func_ov002_0226c584(int arg0, int arg1, int arg2) {
    int sum = arg1 + arg2;
    unsigned short val;
    if (sum > 4) {
        return 0;
    }
    if (func_ov002_021bc8c8(D016C->f_cec, arg0, sum) == 0) {
        return 0;
    }
    val = *(unsigned short *)(data_ov002_022cf1a4 + (arg0 & 1) * 0x868 + sum * 20);
    return val != 0 ? 0x800 : 0;
}
