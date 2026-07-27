#include "ov002_core.h"

extern int func_ov002_021d6780(int player, int idx, int arg3, int arg4, int self_f0, int flag);

int func_ov002_021d6718(struct Ov002Self *self, int player, int idx, int arg3, int arg4) {
    if (func_ov002_021c1d64(self, player, idx) != 0)
        return 0;
    return func_ov002_021d6780(player, idx, arg3, arg4, self->f0, player != self->b0);
}
