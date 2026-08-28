/* func_ov002_021f3228: gate check for a per-player row/sub-row triplet
 * against the "active" selection in data_ov002_022cd314, then defer to
 * func_ov002_021c1d64. */
#include "ov002_core.h"

int func_ov002_021f3228(struct Ov002Self *self, int player, int idx) {
    struct Ov002Slot *row;
    unsigned short *v;

    if (player == self->b0) return 0;
    if (idx >= 5) return 0;

    row = (struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + 0x30 + idx * 0x14);
    if (row->id == 0) return 0;

    v = (unsigned short *)((char *)data_ov002_022cf0c4 + (player & 1) * 0x868 + idx * 0x14);
    if (*v == 0) return 0;

    if (*(int *)(data_ov002_022cd314 + 0x0) != player
        || *(int *)(data_ov002_022cd314 + 0x1c) != idx) {
        return 0;
    }

    return func_ov002_021c1d64(self, player, idx) == 0 ? 1 : 0;
}
