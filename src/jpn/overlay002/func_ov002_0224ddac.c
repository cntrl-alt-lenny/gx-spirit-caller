#include "ov002_core.h"

extern int func_0202e1e0(int id);
extern int func_0202de48(int id);
extern int func_0202b824(int id);
extern unsigned int func_0202b854(int id);
extern int func_ov002_021c3304(int a, int b, int c);
extern char data_ov002_022cf0a0[];

void func_ov002_0224ddac(int player, int arg1) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf0a0 + b0 * 0x868);
    if (cnt > idx) {
        int id;
        char *base = (char *)data_ov002_022cf08c + b0 * 0x868;
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf08c + b0 * 0x868 + 0x418);
        do {
            id = row->id;
            if (func_0202e1e0(id) != 0) {
                if (func_0202de48(id) == 0) {
                    if (func_0202b824(id) == func_0202b824(arg1)) {
                        if ((int)func_0202b854(id) <= 2) {
                            if (func_ov002_021c3304(player, player, idx) != 0) {
                                func_ov002_02253370(player, 14, idx);
                            }
                        }
                    }
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
