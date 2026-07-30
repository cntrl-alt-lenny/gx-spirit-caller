#include "ov002_core.h"

typedef unsigned short u16;

extern int func_ov002_021c8940(int a, int b);

int func_ov002_02203f94(struct Ov002Self *self) {
    u16 s2 = *(u16 *)((char *)self + 2);
    unsigned int field6 = ((unsigned int)(s2 << 20)) >> 26;
    if (field6 != 0x14)
        goto ret0;

    if (*(int *)(data_ov002_022cd3f4 + 8) != 0)
        return 0;

    if (*(int *)(data_ov002_022cd3f4 + 0) == self->b0) {
        if (func_ov002_021c8940(*(int *)(data_ov002_022cd3f4 + 0), *(int *)(data_ov002_022cd3f4 + 0x1c)) == 3)
            return 1;
    }

    if (*(int *)(data_ov002_022cd3f4 + 4) == self->b0) {
        if (func_ov002_021c8940(*(int *)(data_ov002_022cd3f4 + 4), *(int *)(data_ov002_022cd3f4 + 0x20)) == 3)
            return 1;
    }

ret0:
    return 0;
}
