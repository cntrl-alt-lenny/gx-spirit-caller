/* func_ov002_021cd3cc: feed the ce950 high-bit flag + unk2 bytes + unk4/unk6
 * to 021b2d4c, post a 0x24 event, and clear ce950.unk80C. */
#include "ov002_core.h"
extern void func_ov002_021b2c6c(int f, int a, int b, int c, int d);

void func_ov002_021cd3cc(void) {
    int f = (*(unsigned short *)data_ov002_022ce870 & 0x8000) ? 1 : 0;
    int t = *(unsigned short *)(data_ov002_022ce870 + 2);
    func_ov002_021b2c6c(f, (unsigned char)t, (unsigned char)(t >> 8),
                        *(unsigned short *)(data_ov002_022ce870 + 4),
                        *(unsigned short *)(data_ov002_022ce870 + 6));
    func_ov002_0229acd0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce870 + 0x80C) = 0;
}
