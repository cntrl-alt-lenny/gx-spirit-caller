#include "ov002_core.h"

extern int func_0202df78(int id, int arg1);
extern int data_ov002_022cf184[];

int func_ov002_021ba310(int player, int arg1) {
    player &= 1;
    unsigned int count = *(unsigned int *)((char *)data_ov002_022cf184 + player * 0x868);
    unsigned int i = 0;
    if (i < count) {
        struct Ov002Slot *arr = (struct Ov002Slot *)((char *)data_ov002_022cf16c + player * 0x868 + 0x3a0);
        do {
            int id = arr[i].id;
            if (func_0202df78(id, arg1) != 0) {
                return i;
            }
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + player * 0x868 + 0x18));
    }
    return -1;
}
