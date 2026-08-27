#include "ov002_core.h"

extern int data_ov002_022cf09c[];
extern int func_ov002_021bcf50(int player);
extern int func_0202b824(int id);
extern int func_0202b86c(int id);
extern int func_ov002_021b8ea0(int id);
extern int func_ov002_02253370(int a, int b, int c);

/* func_ov002_022523bc: gate func_ov002_021bcf50(player)>=0, then scan
 * player's 0x260 id-array (bounded by data_ov002_022cf09c count) firing
 * func_ov002_02253370(player,13,i) when func_0202b824(id)==22,
 * func_0202b86c(id)==5, func_ov002_021b8ea0(id)==0. */
void func_ov002_022523bc(int player) {
    if (func_ov002_021bcf50(player) < 0)
        return;

    unsigned int count =
        *(unsigned int *)((char *)data_ov002_022cf09c + (player & 1) * 0x868);
    unsigned int i = 0;
    if (i < count) {
        struct Ov002Slot *arr = (struct Ov002Slot *)((char *)data_ov002_022cf08c +
                                                       (player & 1) * 0x868 + 0x260);
        do {
            int id = arr[i].id;
            if (func_0202b824(id) == 22) {
                if (func_0202b86c(id) == 5) {
                    if (func_ov002_021b8ea0(id) == 0) {
                        func_ov002_02253370(player, 13, i);
                    }
                }
            }
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf08c + (player & 1) * 0x868 + 0x10));
    }
}
