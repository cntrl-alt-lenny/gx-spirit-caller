#include "ov002_core.h"

/* func_ov002_021eaf7c (ov002): guard chain over a slot table.
 * index>=5 or slot==obj->b0 reject; else check cf1a4 halfword nonzero,
 * then the 13-bit flags bitfield at row+0x30; then func_ov002_021c1ef0,
 * the cd3f4.f0/f1c pair-match reject, func_ov002_021c1a2c, and finally
 * func_ov002_021c1e44 (INVERTED: returns 1 only when 021c1e44 is 0). */
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cd3f4[];
extern int func_ov002_021c1a2c(int slot, int index, int kind);
extern int func_ov002_021c1e44(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int idx);

struct Slot13_021eaf7c { unsigned int flags : 13; };

int func_ov002_021eaf7c(struct Ov002Self *obj, int slot, int index)
{
    int half;
    int row;

    if (index >= 5)
        return 0;
    if (slot == obj->b0)
        return 0;

    half = (slot & 1) * 0x868;
    row = index * 0x14;

    if (*(unsigned short *)(data_ov002_022cf1a4 + half + row) == 0)
        return 0;

    {
        char *base = data_ov002_022cf16c + half;
        char *p = base + 0x30;
        struct Slot13_021eaf7c *e = (struct Slot13_021eaf7c *)(p + row);
        if (e->flags == 0)
            return 0;
    }

    if (func_ov002_021c1ef0(obj, slot, index) == 0)
        return 0;
    if (*(int *)(data_ov002_022cd3f4 + 0) == slot &&
        *(int *)(data_ov002_022cd3f4 + 0x1c) == index)
        return 0;

    if (func_ov002_021c1a2c(slot, index, obj->f0) == 0)
        return 0;
    if (func_ov002_021c1e44(obj, slot, index) == 0)
        return 1;
    return 0;
}
