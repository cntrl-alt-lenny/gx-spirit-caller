#include "ov002_core.h"

extern int func_0202df24(int id, int arg1);
extern int data_ov002_022cf0a4[];

int func_ov002_021ba230(int player, int arg1) {
    player &= 1;
    unsigned int count = *(unsigned int *)((char *)data_ov002_022cf0a4 + player * 0x868);
    unsigned int i = 0;
    if (i < count) {
        struct Ov002Slot *arr = (struct Ov002Slot *)((char *)data_ov002_022cf08c + player * 0x868 + 0x3a0);
        do {
            int id = arr[i].id;
            if (func_0202df24(id, arg1) != 0) {
                return i;
            }
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf08c + player * 0x868 + 0x18));
    }
    return -1;
}
