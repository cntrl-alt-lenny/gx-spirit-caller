#include "ov002_core.h"

extern int func_0202e1e0(int id);
extern int func_0202de48(int id);
extern int data_ov002_022cf09c[];

void func_ov002_02249830(int player) {
    int b0;
    unsigned int idx;
    unsigned int cnt;
    b0 = player & 1;
    idx = 0;
    cnt = *(unsigned int *)((char *)data_ov002_022cf09c + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf08c + b0 * 0x868 + 0x260);
        char *base = (char *)data_ov002_022cf08c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202e1e0(id) != 0) {
                if (func_0202de48(id) == 2) {
                    func_ov002_02253370(player, 13, idx);
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x10));
    }
}
