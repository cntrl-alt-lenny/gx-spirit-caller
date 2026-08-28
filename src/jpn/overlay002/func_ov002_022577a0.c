/* func_ov002_022577a0: reset CE288->f_5c0, then for each player (0,1) and
 * each sub-row index (0..10, 0x14-byte stride at data_ov002_022cf08c
 * +player*0x868), skip if the packed (u8)player|((u8)idx<<8) equals
 * target, skip if row->f_40 bit 2 is set, otherwise invoke the callback
 * fn(self, player, idx) and count nonzero results. Returns the count. */
#include "ov002_core.h"

struct RowHdr02257888 {
    char _pad[0x40];
    unsigned int f_40;
};

typedef int (*Callback02257888)(void *self, int player, int idx);

int func_ov002_022577a0(void *self, Callback02257888 fn, int target) {
    int count = 0;
    int player;

    CE288->f_5c0 = 0;

    player = 0;
    do {
        int idx = 0;
        struct RowHdr02257888 *row = (struct RowHdr02257888 *)(data_ov002_022cf08c + (player & 1) * 0x868);
        do {
            unsigned short packed = (unsigned char)player | ((unsigned char)idx << 8);
            if (target != packed) {
                if (((row->f_40 >> 2) & 1) == 0) {
                    if (fn(self, player, idx) != 0) {
                        count++;
                    }
                }
            }
            idx++;
            row = (struct RowHdr02257888 *)((char *)row + 0x14);
        } while (idx <= 10);
        player++;
    } while (player < 2);

    return count;
}
