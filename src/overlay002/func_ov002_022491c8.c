#include "ov002_core.h"

extern int func_ov002_0223bb28(int player, int id);
extern int func_ov002_021ca3f0(int arg0, int arg1);

void func_ov002_022491c8(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf184 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf16c + b0 * 0x868 + 0x3a0);
        char *base = (char *)data_ov002_022cf16c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_ov002_0223bb28(player, id) != 0 && func_ov002_021ca3f0(player, id) != 0) {
                func_ov002_02253458(player, 12, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x18));
    }
}
