#include "ov002_core.h"

extern int func_0202e234(int id);
extern int func_0202b8a8(int id);
extern int func_ov002_021ca440(int player, int id);
extern int func_ov002_021b3fd8(int player, int a, int b, int c);

struct Ov002Slot260 {
    unsigned id : 13;
    unsigned flag : 1;
    unsigned _pad0 : 8;
    unsigned val : 8;
    unsigned _pad1 : 2;
};

void func_ov002_02249d9c(int player) {
    int b0;
    unsigned int idx;
    unsigned int cnt;
    b0 = player & 1;
    idx = 0;
    cnt = *(unsigned int *)((char *)data_ov002_022cf17c + b0 * 0x868);
    if (cnt > idx) {
        int id;
        struct Ov002Slot260 *row = (struct Ov002Slot260 *)((char *)data_ov002_022cf16c + b0 * 0x868 + 0x260);
        char *base = (char *)data_ov002_022cf16c + b0 * 0x868;
        do {
            id = row->id;
            if (func_0202e234(id) != 0) {
                if (func_0202b8a8(id) <= 3) {
                    if (func_ov002_021ca440(player, id) != 0) {
                        if (func_ov002_021b3fd8(player, 11, 0x12a1, row->val * 2 + row->flag) == 0) {
                            func_ov002_02253458(player, 13, idx);
                        }
                    }
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x10));
    }
}
