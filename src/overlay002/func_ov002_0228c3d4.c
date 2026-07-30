/* func_ov002_0228c3d4: for i=5..9 over player's cf16c slot array, if
 * slot.id!=0 and func_ov002_021b9ecc(player,i)==target, forward to
 * func_ov002_021fbf74(player, player, i, 0); return 1 if it holds. */
#include "ov002_core.h"

extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_021fbf74(int a, int b, int c, int d);

int func_ov002_0228c3d4(int player, int target) {
    int i;
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    char *id_ptr = row + 0x94;

    for (i = 5; i < 10; i++) {
        if (((struct Ov002Slot *)id_ptr)->id != 0) {
            if (func_ov002_021b9ecc(player, i) == target) {
                if (func_ov002_021fbf74(player, player, i, 0) != 0)
                    return 1;
            }
        }
        id_ptr += 0x14;
    }
    return 0;
}
