#include "ov002_core.h"

extern int data_ov002_022cf180[];

struct Entry0224fad8 {
    unsigned pad : 15;
    unsigned flag2 : 2;
    unsigned rest : 15;
};

void func_ov002_0224fad8(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf180 + b0 * 0x868);
    if (cnt > idx) {
        struct Entry0224fad8 *row = (struct Entry0224fad8 *)((char *)data_ov002_022cf16c + b0 * 0x868 + 0x418);
        char *base = (char *)data_ov002_022cf16c + b0 * 0x868;
        do {
            if (row->flag2 != 0) {
                func_ov002_02253458(player, 14, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
