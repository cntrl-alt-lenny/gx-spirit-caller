#include "ov002_core.h"

extern int func_0202e1e0(int id);
extern char data_ov002_022cf0a0[];

struct Ov002Slot418 {
    unsigned id : 13;
    unsigned _pad0 : 4;
    unsigned flagA : 1;
    unsigned _pad1 : 2;
    unsigned flagB : 1;
    unsigned _pad2 : 11;
};

void func_ov002_02249ddc(int player) {
    int b0;
    unsigned int idx;
    unsigned int cnt;
    b0 = player & 1;
    idx = 0;
    cnt = *(unsigned int *)((char *)data_ov002_022cf0a0 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot418 *row = (struct Ov002Slot418 *)((char *)data_ov002_022cf08c + b0 * 0x868 + 0x418);
        char *base = (char *)data_ov002_022cf08c + b0 * 0x868;
        do {
            if (func_0202e1e0(row->id) != 0) {
                if (row->flagA) {
                    if (!row->flagB) {
                        func_ov002_02253370(player, 14, idx);
                    }
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
