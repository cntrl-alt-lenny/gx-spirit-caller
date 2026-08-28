#include "ov002_core.h"
extern int func_0202df24(int id, int arg);

int func_ov002_021ba1b4(int player, int arg1) {
    int off = (player & 1) * 0x868;
    unsigned int count = *(unsigned int *)((char *)data_ov002_022cf09c + off);
    unsigned int i;
    for (i = 0; i < count; i++) {
        struct Ov002Slot *arr = (struct Ov002Slot *)(data_ov002_022cf08c + off + 0x260);
        char *row = data_ov002_022cf08c + off;
        if (func_0202df24(arr[i].id, arg1) != 0)
            return i;
        count = *(unsigned int *)(row + 0x10);
    }
    return -1;
}
