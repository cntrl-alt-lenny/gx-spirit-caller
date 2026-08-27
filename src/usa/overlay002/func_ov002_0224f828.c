#include "ov002_core.h"

extern int func_0202b824(int id);
extern int func_ov002_021ca310(int player, int id);
extern int func_ov002_0223ba38(int player, int id);

/* func_ov002_0224f828: scan player's 0x3a0 id-array (bounded by the
 * data_ov002_022cf0a4 count); for each entry whose func_0202b824 kind == 7
 * and passes the func_ov002_021ca310 / func_ov002_0223ba38 gates, fire
 * func_ov002_02253370(player, 12, i). */
void func_ov002_0224f828(int player) {
    unsigned int count =
        *(unsigned int *)((char *)data_ov002_022cf0a4 + (player & 1) * 0x868);
    unsigned int i = 0;
    if (i < count) {
        struct Ov002Slot *arr = (struct Ov002Slot *)((char *)data_ov002_022cf08c +
                                                       (player & 1) * 0x868 + 0x3a0);
        do {
            int id = arr[i].id;
            if (func_0202b824(id) == 7) {
                if (func_ov002_021ca310(player, id) != 0) {
                    if (func_ov002_0223ba38(player, id) != 0) {
                        func_ov002_02253370(player, 12, i);
                    }
                }
            }
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf08c + (player & 1) * 0x868 + 0x18));
    }
}
