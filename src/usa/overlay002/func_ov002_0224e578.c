#include "ov002_core.h"

extern int data_ov002_022cf0a0[];
extern int func_0202ea5c(int id);

void func_ov002_0224e578(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf0a0 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf08c + b0 * 0x868 + 0x418);
        char *base = (char *)data_ov002_022cf08c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202ea5c(id) != 0) {
                func_ov002_02253370(player, 14, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
