/* func_ov002_021d5be0: guard via func_021b4054; else arg-pack into func_021d479c
 * (kind 55) with an arg1/arg3 byte-pack and a 0x100-tagged 4th payload. */
#include "ov002_core.h"
extern int func_ov002_021b4054(int a);
int func_ov002_021d5be0(int arg0, int arg1, int arg2, int arg3, int arg4) {
    int r = func_ov002_021b4054(arg0);
    if (r == 0) return r;
    return func_ov002_021d479c((u16)((arg0 ? 0x8000 : 0) | 55),
                               (u16)((u8)arg1 | ((u8)arg3 << 8)),
                               (u16)arg2, (u16)((u8)arg4 | 0x100));
}
