#include "ov002_core.h"

extern int data_ov002_022cf0a0[];
extern int func_0202e1e0(int x);
extern int func_ov002_021c3304(int a, int b, int c);

void func_ov002_02249aa0(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf0a0 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf08c + b0 * 0x868 + 0x418);
        char *base = (char *)data_ov002_022cf08c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202e1e0(id) != 0 && func_ov002_021c3304(player, player, idx) != 0) {
                func_ov002_02253370(player, 14, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
