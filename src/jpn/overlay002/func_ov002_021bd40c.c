#include "ov002_core.h"
extern char data_ov002_022cf0a0[];
extern int func_0202b824(int id);
extern int func_0202b86c(int id);

int func_ov002_021bd40c(int player, int val) {
    int off = (player & 1) * 0x868;
    unsigned int precheck = *(unsigned int *)(data_ov002_022cf0a0 + off);
    unsigned int i;
    int matchcount = 0;
    for (i = 0; i < precheck; i++, precheck = *(unsigned int *)(data_ov002_022cf08c + off + 0x14)) {
        struct Ov002Slot *arr = (struct Ov002Slot *)(data_ov002_022cf08c + off + 0x418);
        int id = arr[i].id;
        if (func_0202b824(id) == 0x17) {
            if (func_0202b86c(id) == val)
                matchcount++;
        }
    }
    return matchcount;
}
