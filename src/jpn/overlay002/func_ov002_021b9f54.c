#include "ov002_core.h"

extern int func_ov002_021b4040(int player, int idx, int id);
extern int func_ov002_021bd77c(int result);

int func_ov002_021b9f54(int player, int idx) {
    char *row = (char *)data_ov002_022cf08c + (player & 1) * 0x868 + idx * 20;
    int val = ((struct Ov002Slot *)(row + 0x30))->id;
    if (idx > 4)
        goto ret_val;
    if (val != 0x1a74)
        goto ret_val;
    val = func_ov002_021b4040(player, idx, val);
    if (val == -1)
        goto ret_const;
    if (func_ov002_021bd77c(val) == 0)
        goto ret_val;
ret_const:
    return 0x1a74;
ret_val:
    return val;
}
