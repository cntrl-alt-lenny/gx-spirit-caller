#include "ov002_core.h"
extern char data_ov002_022cf0a0[];
extern unsigned int func_0202b824(int id);

int func_ov002_021bd284(int player, int arg1) {
    int off = (player & 1) * 0x868;
    unsigned int precheck = *(unsigned int *)(data_ov002_022cf0a0 + off);
    unsigned int i;
    unsigned int count = 0;
    for (i = 0; i < precheck; i++, precheck = *(unsigned int *)(data_ov002_022cf08c + off + 0x14)) {
        struct Ov002Slot *arr = (struct Ov002Slot *)(data_ov002_022cf08c + off + 0x418);
        if (arg1 == (int)func_0202b824(arr[i].id))
            count++;
    }
    return count;
}
