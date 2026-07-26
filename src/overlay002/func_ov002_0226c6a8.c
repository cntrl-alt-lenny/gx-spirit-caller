#include "ov002_core.h"

int func_ov002_0226c6a8(int arg0, int arg1, int arg2) {
    int sum;
    int mask;
    char *row;
    struct Ov002Slot *slot;

    sum = arg1 + arg2;
    if (arg0 != *(int *)(data_ov002_022d016c + 0xd94))
        return 0;
    if (sum > 4)
        return 0;
    mask = arg0 & 1;
    row = data_ov002_022cf16c + mask * 0x868;
    slot = (struct Ov002Slot *)(row + sum * 0x14 + 0x30);
    return (slot->id != 0) ? 0x800 : 0;
}
