/* func_ov002_021d5bb4: guard via func_021b4204; else arg-pack into func_021d479c
 * (kind 55) with arg0 bit0/>>1 derived payloads. */
#include "ov002_core.h"
extern int func_ov002_021b4124(int a);
int func_ov002_021d5bb4(int arg0, int arg1, int arg2) {
    int r = func_ov002_021b4124(arg0);
    if (r == 0) return r;
    return func_ov002_021d46ac((u16)(((arg0 & 1) ? 0x8000 : 0) | 55),
                               (u16)((u8)(arg0 >> 1) | 0x100),
                               (u16)(arg1 | 0x8000), (u16)arg2);
}
