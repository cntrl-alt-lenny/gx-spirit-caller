#include "ov002_core.h"

extern int func_ov002_021b9ecc(int player, int idx);

int func_ov002_021bb5a8(int player, int want)
{
    int i;
    int count;
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    int bit;

    count = 0;
    bit = player << 4;
    for (i = 0; i < 5; i++, row += 0x14, bit++) {
        int r = func_ov002_021b9ecc(player, i);
        if (r == want) {
            u32 v = *(u32 *)(row + 0x40);
            u16 h = *(u16 *)(row + 0x38);
            if ((h & ~((v >> 6) & 1)) & ~(((v >> 1) | (v >> 2)) & 1)) {
                if ((v >> 18) & 1) {
                    if ((*(u32 *)(data_ov002_022d016c + 0xd4) & (1 << bit)) == 0)
                        count++;
                }
            }
        }
    }
    return count;
}
