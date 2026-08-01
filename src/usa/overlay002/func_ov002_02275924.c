#include "ov002_core.h"

extern int data_ov002_022cd220;
extern int func_ov002_021b8eec(int player, int idx);
extern int func_ov002_021c22cc(int player, int idx);

int func_ov002_02275924(int player, int arg1, int arg2) {
    struct Ov002Slot *slot;
    int idx = arg1 + arg2;

    if (player != (int)(((unsigned)(data_ov002_022cd220 << 31)) >> 31))
        return 0;
    if (idx > 10)
        return 0;

    slot = (struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + idx * 20 + 0x30);
    if (slot->id == 0)
        return 0;

    if (idx < 5) {
        if (func_ov002_021b8eec(player, idx) == 0)
            goto fail;
    }

    if (func_ov002_021c22cc(player, idx) != 0)
        return 0x800;

fail:
    return 0;
}
