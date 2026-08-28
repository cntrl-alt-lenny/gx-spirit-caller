/* func_ov002_021d9054: gated dispatch. If func_02030e50(func_ov002_021b9dec(arg0,arg1))
 * is 0, return 0. Else if arg2 != 0, tail-call the 021d479c arg-pack with
 * kind 0x3b and tag 1. Else, require func_ov002_021b9af4(arg0,arg1) nonzero,
 * then tail-call the same arg-pack with tag 0. */
#include "ov002_core.h"

extern int func_ov002_021b9dec(int a, int b);
extern int func_02030e50(int a);
extern int func_ov002_021b9af4(int a, int b);

int func_ov002_021d9054(int arg0, int arg1, int arg2) {
    int t = func_02030e50(func_ov002_021b9dec(arg0, arg1));
    if (t == 0)
        return t;
    if (arg2 != 0) {
        return func_ov002_021d46ac((u16)((arg0 ? 0x8000 : 0) | 0x3b), (u16)arg1, 1, 0);
    }
    {
        int r = func_ov002_021b9af4(arg0, arg1);
        if (r == 0)
            return r;
    }
    return func_ov002_021d46ac((u16)((arg0 ? 0x8000 : 0) | 0x3b), (u16)arg1, 0, 0);
}
