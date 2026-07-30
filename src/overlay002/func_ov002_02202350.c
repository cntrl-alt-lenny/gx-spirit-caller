#include "ov002_core.h"

typedef unsigned short u16;

int func_ov002_02202350(struct Ov002Self *self) {
    u16 s2 = *(u16 *)((char *)self + 2);
    unsigned int field6 = ((unsigned int)(s2 << 20)) >> 26;
    if (field6 != 0x12 && field6 != 0x13)
        return 0;

    if (*(int *)(data_ov002_022cd3f4 + 0) != (1 - self->b0))
        return 0;

    if (func_ov002_021c1ef0(self, *(int *)(data_ov002_022cd3f4 + 0), *(int *)(data_ov002_022cd3f4 + 0x1c)) == 0)
        return 0;

    if (func_ov002_021c1e44(self, *(int *)(data_ov002_022cd3f4 + 0), *(int *)(data_ov002_022cd3f4 + 0x1c)) == 0)
        return 1;
    return 0;
}
