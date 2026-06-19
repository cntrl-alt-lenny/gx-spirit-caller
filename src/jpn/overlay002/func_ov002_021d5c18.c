/* func_ov002_021d5c18: arg-pack into func_021d479c (kind 56); arg1/arg2 byte-pack
 * the 2nd payload, arg3 + a stacked u16 the 3rd/4th. */
#include "ov002_core.h"
int func_ov002_021d5c18(int arg0, int arg1, int arg2, int arg3, u16 arg4) {
    return func_ov002_021d46ac((u16)((arg0 ? 0x8000 : 0) | 56),
                               (u16)((u8)arg1 | ((u8)arg2 << 8)), arg3, arg4);
}
