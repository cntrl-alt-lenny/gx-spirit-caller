/* func_ov002_021d5918: guard via func_021c1e44 (return 0 if set); else arg-pack
 * into func_021d479c (kind 54, flag from arg1) and return 1. */
#include "ov002_core.h"
int func_ov002_021d5918(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5) {
    if (func_ov002_021c1d64(arg0, arg1, arg2) != 0) return 0;
    func_ov002_021d46ac((u16)((arg1 ? 0x8000 : 0) | 54),
                        (u16)((u8)arg2 | ((u8)arg4 << 8)), arg3, arg5);
    return 1;
}
