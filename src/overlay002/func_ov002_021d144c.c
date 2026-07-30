/* func_ov002_021d144c: toggle bit f2 of data_ov002_022cf288's per-flag
 * ((f0 bit15) & 1)-selected row, set if f4 is nonzero else cleared. Then
 * posts func_ov002_0229ade0(0x24,0,0,0) and clears ce950.f80c. */
#include "ov002_core.h"

extern char data_ov002_022cf288[];

void func_ov002_021d144c(void) {
    int flag = (*(u16 *)(data_ov002_022ce950 + 0) & 0x8000) != 0;
    u16 f4 = *(u16 *)(data_ov002_022ce950 + 4);
    u16 f2 = *(u16 *)(data_ov002_022ce950 + 2);
    if (f4 != 0) {
        int *p = (int *)(data_ov002_022cf288 + (flag & 1) * 0x868);
        *p = *p | (1 << f2);
    } else {
        int *p = (int *)(data_ov002_022cf288 + (flag & 1) * 0x868);
        *p = *p & ~(1 << f2);
    }
    func_ov002_0229ade0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
