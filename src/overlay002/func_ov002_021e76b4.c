/* func_ov002_021e76b4: 0x868 accessor wrapper — opponent / idx / f30 guards,
 * require func_ov002_021c1ef0, then report func_ov002_021c1e44 clear. */
#include "ov002_core.h"

int func_ov002_021e76b4(struct Ov002Self *self, int player, int idx) {
    if (player == self->b0)
        return 0;
    if (idx >= 5)
        return 0;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20 + 0x30))->id == 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
