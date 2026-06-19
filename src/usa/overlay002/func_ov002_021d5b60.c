/* func_ov002_021d5b60: guard via func_021b3f5c; on success arg-pack into
 * func_021d479c (kind 56) with the guard result as the high byte. */
#include "ov002_core.h"
extern int func_ov002_021b3e7c(int a);
int func_ov002_021d5b60(int arg0, int arg1) {
    int r = func_ov002_021b3e7c(arg0);
    if (r == 0) return r;
    return func_ov002_021d46ac((u16)((arg0 ? 0x8000 : 0) | 56),
                               (u16)((u8)arg1 | ((u8)r << 8)), 0, 0);
}
