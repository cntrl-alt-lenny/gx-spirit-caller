#include "ov002_core.h"

extern int func_0202b878(int id);
extern int func_ov002_021ca3f0(int player, int id);
extern int func_ov002_0223bb28(int player, int id);

/* func_ov002_0224f910: scan player's 0x3a0 id-array (bounded by the
 * data_ov002_022cf184 count); for each entry whose func_0202b878 kind == 7
 * and passes the func_ov002_021ca3f0 / func_ov002_0223bb28 gates, fire
 * func_ov002_02253458(player, 12, i). */
void func_ov002_0224f910(int player) {
    unsigned int count =
        *(unsigned int *)((char *)data_ov002_022cf184 + (player & 1) * 0x868);
    unsigned int i = 0;
    if (i < count) {
        struct Ov002Slot *arr = (struct Ov002Slot *)((char *)data_ov002_022cf16c +
                                                       (player & 1) * 0x868 + 0x3a0);
        do {
            int id = arr[i].id;
            if (func_0202b878(id) == 7) {
                if (func_ov002_021ca3f0(player, id) != 0) {
                    if (func_ov002_0223bb28(player, id) != 0) {
                        func_ov002_02253458(player, 12, i);
                    }
                }
            }
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x18));
    }
}
