#include "ov002_core.h"

struct CdBit13 {
    unsigned id : 13;
};

int func_ov002_021bbdcc(int player) {
    char *p = (char *)data_ov002_022cf08c + (player & 1) * 0x868 + 0x30;
    int count = 0;
    int i;

    for (i = 0; i <= 10; i++) {
        if (((struct Ov002Slot *)p)->id != 0)
            count++;
        p += 0x14;
    }

    if (!(D016C->f_d0 & 1))
        goto ret;
    if (player == *(int *)(data_ov002_022cd314 + 0) &&
        ((struct CdBit13 *)(data_ov002_022cd314 + 0xc4))->id != 0)
        count += 1;
    if (player != *(int *)(data_ov002_022cd314 + 4))
        goto ret;
    if (((struct CdBit13 *)(data_ov002_022cd314 + 0xd8))->id != 0)
        count += 1;
ret:
    return count;
}
