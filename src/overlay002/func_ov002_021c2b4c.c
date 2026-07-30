/* func_ov002_021c2b4c: remove slot `idx` from player (player&1)'s cf16c
 * table, shifting subsequent slots down by one via func_ov002_021b91c4.
 * Returns 0 if idx was already out of range. */
#include "ov002_core.h"

extern char data_ov002_022cf180[];
extern void func_ov002_021b91c4(int *dst, const int *src);

int func_ov002_021c2b4c(int player, int idx) {
    struct Ov002Slot *arr;
    int off = (player & 1) * 0x868;
    unsigned int count = *(unsigned int *)(data_ov002_022cf180 + off);
    if ((unsigned)idx >= count)
        goto ret0;
    count--;
    *(unsigned int *)(data_ov002_022cf180 + off) = count;
    if ((unsigned)idx >= count)
        goto done;
    arr = (struct Ov002Slot *)(data_ov002_022cf16c + off + 0x418);
    do {
        func_ov002_021b91c4((int *)&arr[idx], (int *)&arr[idx + 1]);
        idx++;
    } while ((unsigned)idx < *(unsigned int *)(data_ov002_022cf16c + off + 0x14));
done:
    return 1;
ret0:
    return 0;
}
