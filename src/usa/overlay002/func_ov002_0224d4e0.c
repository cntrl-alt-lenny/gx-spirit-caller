#include "ov002_core.h"

extern int func_0202de48(void);
extern int func_0202b86c(int id);

void func_ov002_0224d4e0(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf09c + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf08c + b0 * 0x868 + 0x260);
        char *base = (char *)data_ov002_022cf08c + b0 * 0x868;
        do {
            int id = row->id;
            if (((int (*)(int))func_0202de48)(id) == 2 || func_0202b86c(id) == 6) {
                func_ov002_02253370(player, 13, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x10));
    }
}
