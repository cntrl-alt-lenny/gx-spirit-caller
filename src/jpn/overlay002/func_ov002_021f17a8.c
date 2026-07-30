/* func_ov002_021f17a8: guard chain over 3 core.h-declared sinks, all called
 * via pure pass-through (self/player/idx never touched by the row-id guard,
 * so they stay live in r0/r1/r2 for the forwarded calls). */
#include "ov002_core.h"

int func_ov002_021f17a8(struct Ov002Self *self, int player, int idx) {
    char *row = data_ov002_022cf08c + (player & 1) * 0x868 + idx * 0x14;

    if (((struct Ov002Slot *)(row + 0x30))->id == 0)
        return 0;
    if (func_ov002_021c1e10(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c1d64(self, player, idx) != 0)
        return 0;
    return func_ov002_021c1fa4(self, player, idx, 1) != 0;
}
