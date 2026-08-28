#include "ov002_core.h"

extern int data_ov002_022cf0a8[];
extern int func_0202e1e0(int id);
extern int func_ov002_021c3528(int a, int b, int c);
extern int func_ov002_021c97ac(int a, int b, int c);

/* func_ov002_0224d428: scan player's 0x5d0 id-array (bounded by the
 * data_ov002_022cf0a8 count); for each entry whose id passes
 * func_0202e1e0, then func_ov002_021c3528(player, player, i), then
 * func_ov002_021c97ac(player, 15, i), fire
 * func_ov002_02253370(player, 15, i). */
void func_ov002_0224d428(int player) {
    unsigned int count =
        *(unsigned int *)((char *)data_ov002_022cf0a8 + (player & 1) * 0x868);
    unsigned int i = 0;
    if (i < count) {
        struct Ov002Slot *arr = (struct Ov002Slot *)((char *)data_ov002_022cf08c +
                                                       (player & 1) * 0x868 + 0x5d0);
        do {
            int id = arr[i].id;
            if (func_0202e1e0(id) != 0) {
                if (func_ov002_021c3528(player, player, i) != 0) {
                    if (func_ov002_021c97ac(player, 15, i) != 0) {
                        func_ov002_02253370(player, 15, i);
                    }
                }
            }
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf08c + (player & 1) * 0x868 + 0x1c));
    }
}
