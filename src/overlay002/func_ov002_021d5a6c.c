/* func_ov002_021d5a6c: arg-pack into func_021d479c (kind 54); flag + 2nd payload
 * derive from arg0's bit0 and arg0>>1. */
#include "ov002_core.h"
int func_ov002_021d5a6c(int arg0, int arg1, int arg2, int arg3) {
    return func_ov002_021d479c((u16)(((arg0 & 1) ? 0x8000 : 0) | 54),
                               (u16)((u8)(arg0 >> 1) | ((u8)arg2 << 8)),
                               (u16)(arg1 | 0x8000), arg3);
}
