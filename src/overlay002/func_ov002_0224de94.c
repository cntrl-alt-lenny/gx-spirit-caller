#include "ov002_core.h"

extern int func_0202e234(int id);
extern int func_0202de9c(int id);
extern int func_0202b878(int id);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021c33e4(int a, int b, int c);
extern char data_ov002_022cf180[];

void func_ov002_0224de94(int player, int arg1) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf180 + b0 * 0x868);
    if (cnt > idx) {
        int id;
        char *base = (char *)data_ov002_022cf16c + b0 * 0x868;
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf16c + b0 * 0x868 + 0x418);
        do {
            id = row->id;
            if (func_0202e234(id) != 0) {
                if (func_0202de9c(id) == 0) {
                    if (func_0202b878(id) == func_0202b878(arg1)) {
                        if ((int)func_0202b8a8(id) <= 2) {
                            if (func_ov002_021c33e4(player, player, idx) != 0) {
                                func_ov002_02253458(player, 14, idx);
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
