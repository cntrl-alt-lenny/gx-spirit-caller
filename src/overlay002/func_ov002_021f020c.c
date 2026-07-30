/* func_ov002_021f020c: 0x868 accessor wrapper -- idx/slot-id/cf1a4 guards,
 * require func_ov002_021c1ef0, then report whether self->f0 differs from
 * func_ov002_021b9ecc(player,idx). */
#include "ov002_core.h"

extern int func_ov002_021b9ecc(int a, int b);

int func_ov002_021f020c(struct Ov002Self *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 20))->id == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    return self->f0 != func_ov002_021b9ecc(player, idx);
}
