#include "ov002_core.h"

extern int data_ov002_022cf180[];
extern int func_0202e234(int id);

void func_ov002_022505e8(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf180 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf16c + b0 * 0x868 + 0x418);
        char *base = (char *)data_ov002_022cf16c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202e234(id) != 0) {
                func_ov002_02253458(player, 14, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
