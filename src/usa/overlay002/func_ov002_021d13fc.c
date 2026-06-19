/* func_ov002_021d13fc: feed the ce950 high-bit flag + unk2/4/6 to 021c9b80,
 * post a 0x24 event, and clear ce950.unk80C. */
#include "ov002_core.h"
extern void func_ov002_021c9aa0(int f, int a, int b, int c);

void func_ov002_021d13fc(void) {
    int f = (*(unsigned short *)data_ov002_022ce870 & 0x8000) ? 1 : 0;
    func_ov002_021c9aa0(f, *(unsigned short *)(data_ov002_022ce870 + 2),
                        *(unsigned short *)(data_ov002_022ce870 + 4),
                        *(unsigned short *)(data_ov002_022ce870 + 6));
    func_ov002_0229acd0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce870 + 0x80C) = 0;
}
