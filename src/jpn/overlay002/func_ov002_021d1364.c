/* func_ov002_021d1364: toggle bit f2 of data_ov002_022cf1a8's per-flag
 * ((f0 bit15) & 1)-selected row, set if f4 is nonzero else cleared. Then
 * posts func_ov002_0229acd0(0x24,0,0,0) and clears ce950.f80c. */
#include "ov002_core.h"

extern char data_ov002_022cf1a8[];

void func_ov002_021d1364(void) {
    int flag = (*(u16 *)(data_ov002_022ce870 + 0) & 0x8000) != 0;
    u16 f4 = *(u16 *)(data_ov002_022ce870 + 4);
    u16 f2 = *(u16 *)(data_ov002_022ce870 + 2);
    if (f4 != 0) {
        int *p = (int *)(data_ov002_022cf1a8 + (flag & 1) * 0x868);
        *p = *p | (1 << f2);
    } else {
        int *p = (int *)(data_ov002_022cf1a8 + (flag & 1) * 0x868);
        *p = *p & ~(1 << f2);
    }
    func_ov002_0229acd0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce870 + 0x80c) = 0;
}
