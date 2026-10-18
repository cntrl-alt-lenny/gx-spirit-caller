#include "ov002_core.h"

extern int func_0202e234(int id);
extern char data_ov002_022cf180[];

struct Ov002Slot418 {
    unsigned id : 13;
    unsigned lo : 1;
    unsigned _pad1 : 8;
    unsigned hi : 8;
    unsigned _pad2 : 2;
};

void func_ov002_02249c28(int player, int unused, int val) {
    int b0;
    unsigned int idx;
    unsigned int cnt;
    unsigned int x;
    b0 = player & 1;
    idx = 0;
    cnt = *(unsigned int *)((char *)data_ov002_022cf180 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot418 *row = (struct Ov002Slot418 *)((char *)data_ov002_022cf16c + b0 * 0x868 + 0x418);
        char *base = (char *)data_ov002_022cf16c + b0 * 0x868;
        do {
            if (func_0202e234(row->id) != 0 && func_ov002_021c33e4(player, player, idx) != 0) {
                x = row->hi * 2 + row->lo;
                if (val != x) {
                    func_ov002_02253458(player, 14, idx);
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
