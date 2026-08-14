#include "ov002_core.h"

extern int data_ov002_022cf188[];
extern int func_0202e234(int id);
extern int func_ov002_021c3608(int a, int b, int c);
extern int func_ov002_021c988c(int a, int b, int c);

/* func_ov002_0224d510: scan player's 0x5d0 id-array (bounded by the
 * data_ov002_022cf188 count); for each entry whose id passes
 * func_0202e234, then func_ov002_021c3608(player, player, i), then
 * func_ov002_021c988c(player, 15, i), fire
 * func_ov002_02253458(player, 15, i). */
void func_ov002_0224d510(int player) {
    unsigned int count =
        *(unsigned int *)((char *)data_ov002_022cf188 + (player & 1) * 0x868);
    unsigned int i = 0;
    if (i < count) {
        struct Ov002Slot *arr = (struct Ov002Slot *)((char *)data_ov002_022cf16c +
                                                       (player & 1) * 0x868 + 0x5d0);
        do {
            int id = arr[i].id;
            if (func_0202e234(id) != 0) {
                if (func_ov002_021c3608(player, player, i) != 0) {
                    if (func_ov002_021c988c(player, 15, i) != 0) {
                        func_ov002_02253458(player, 15, i);
                    }
                }
            }
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x1c));
    }
}
