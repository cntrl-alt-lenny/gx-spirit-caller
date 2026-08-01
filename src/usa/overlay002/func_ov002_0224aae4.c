#include "ov002_core.h"

extern int data_ov002_022cf0a8[];
extern int func_0202e1e0(int x);
extern int func_ov002_021c97ac(int a, int b, int c);

void func_ov002_0224aae4(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf0a8 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf08c + b0 * 0x868 + 0x5d0);
        char *base = (char *)data_ov002_022cf08c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202e1e0(id) != 0 && func_ov002_021c97ac(player, 15, idx) != 0) {
                func_ov002_02253370(player, 15, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x1c));
    }
}
