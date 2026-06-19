/* func_ov002_021ca710: post a 9 event carrying the ce950 high-bit flag, then a
 * 0x24 event, and clear ce950.unk80C. */
#include "ov002_core.h"
void func_ov002_021ca710(void) {
    int f = (*(unsigned short *)data_ov002_022ce870 & 0x8000) ? 1 : 0;
    func_ov002_0229acd0(9, f, 0, 0);
    func_ov002_0229acd0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce870 + 0x80C) = 0;
}
