/* func_ov002_021bd45c: count how many slots in player (arg0&1)'s cf16c table
 * map (via func_0202b878) to type 0x16 AND whose func_0202b8c0 mapping equals
 * arg1. */
#include "ov002_core.h"

extern char data_ov002_022cf180[];
extern unsigned int func_0202b878(int id);
extern int func_0202b8c0(int id);

int func_ov002_021bd45c(int player, int arg1) {
    int off = (player & 1) * 0x868;
    unsigned int precheck = *(unsigned int *)(data_ov002_022cf180 + off);
    unsigned int i;
    unsigned int count = 0;
    for (i = 0; i < precheck; i++, precheck = *(unsigned int *)(data_ov002_022cf16c + off + 0x14)) {
        struct Ov002Slot *arr = (struct Ov002Slot *)(data_ov002_022cf16c + off + 0x418);
        unsigned int id = arr[i].id;
        if (func_0202b878(id) == 0x16 && func_0202b8c0(id) == arg1)
            count++;
    }
    return count;
}
