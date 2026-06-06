/* func_ov002_021d8414: 7-arg arg-pack into func_021d479c (kind 65); 3 packed
 * payloads, the last a (u8) byte-pack. */
#include "ov002_core.h"
int func_ov002_021d8414(int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6) {
    return func_ov002_021d479c(65,
        (u16)((arg0 & 1) | ((unsigned)(arg1 << 27) >> 26) | ((unsigned)(arg2 << 22) >> 16)),
        (u16)((arg3 & 1) | ((unsigned)(arg4 << 27) >> 26)),
        (u16)((u8)arg5 | ((u8)arg6 << 8)));
}
