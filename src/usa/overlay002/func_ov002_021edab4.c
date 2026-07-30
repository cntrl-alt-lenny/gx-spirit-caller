/* func_ov002_021edab4: guard chain (idx range, self->b0 vs player, row-id,
 * core.h sink 021c1ef0 pass-through) then a final cd3f4 dual-field check. */
#include "ov002_core.h"

int func_ov002_021edab4(struct Ov002Self *self, int player, int idx) {
    char *row;

    if (idx >= 5)
        return 0;
    if (player == self->b0)
        return 0;
    row = data_ov002_022cf08c + (player & 1) * 0x868 + idx * 0x14;
    if (((struct Ov002Slot *)(row + 0x30))->id == 0)
        return 0;
    if (func_ov002_021c1e10(self, player, idx) == 0)
        return 0;
    if (*(int *)data_ov002_022cd314 == player && *(int *)(data_ov002_022cd314 + 0x1c) == idx)
        return 0;
    return 1;
}
