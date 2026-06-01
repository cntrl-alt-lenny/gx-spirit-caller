/* func_ov002_021ca7f0: post a 9 event carrying the ce950 high-bit flag, then a
 * 0x24 event, and clear ce950.unk80C. */
#include "ov002_core.h"
void func_ov002_021ca7f0(void) {
    int f = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    func_ov002_0229ade0(9, f, 0, 0);
    func_ov002_0229ade0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80C) = 0;
}
