#include "ov002_core.h"
extern int func_0202df78(int id, int arg);

int func_ov002_021c3b60(int player, int arg1) {
    int off = (player & 1) * 0x868;
    unsigned int count = *(unsigned int *)(data_ov002_022cf178 + off);
    unsigned int i;
    for (i = 0; i < count; i++) {
        struct Ov002Slot *arr = (struct Ov002Slot *)(data_ov002_022cf16c + off + 0x120);
        char *row = data_ov002_022cf16c + off;
        if (func_0202df78(arr[i].id, arg1) != 0)
            return i;
        count = *(unsigned int *)(row + 0xc);
    }
    return -1;
}
