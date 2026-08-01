#include "ov002_core.h"

extern int func_0202e28c(int id);
extern int func_ov002_021c3304(int a, int b, int idx);
extern char data_ov002_022cf0a0[];

void func_ov002_0224ee9c(int player) {
    int b0;
    unsigned int idx;
    unsigned int cnt;
    b0 = player & 1;
    idx = 0;
    cnt = *(unsigned int *)((char *)data_ov002_022cf0a0 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf08c + b0 * 0x868 + 0x418);
        char *base = (char *)data_ov002_022cf08c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202e28c(id) != 0) {
                if (func_ov002_021c3304(player, player, idx) != 0) {
                    func_ov002_02253370(player, 14, idx);
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
