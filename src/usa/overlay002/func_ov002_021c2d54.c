#include "ov002_core.h"

extern int func_0202df24(int id, int arg1);
extern char data_ov002_022cf0a0[];

int func_ov002_021c2d54(int player, int arg1) {
    player &= 1;
    int count = *(int *)(data_ov002_022cf0a0 + player * 0x868);
    int i = count - 1;
    if (i >= 0) {
        struct Ov002Slot *arr = (struct Ov002Slot *)((char *)data_ov002_022cf08c + player * 0x868 + 0x418);
        do {
            int id = arr[i].id;
            if (func_0202df24(id, arg1) != 0) {
                return i;
            }
            i--;
        } while (i >= 0);
    }
    return -1;
}
