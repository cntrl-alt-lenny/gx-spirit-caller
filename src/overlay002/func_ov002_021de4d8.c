#include "ov002_core.h"

extern int func_ov002_021de408(void *self, int mask);

int func_ov002_021de4d8(struct Ov002Self *self, int player, int idx)
{
    int mask;

    if (func_ov002_021c2084(self, player, idx, 1) == 0)
        goto ret0;
    mask = 1 << (idx + player * 16);
    return (func_ov002_021de408(self, mask) & mask) != 0;
ret0:
    return 0;
}
