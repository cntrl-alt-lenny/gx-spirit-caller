#include "ov002_core.h"

typedef unsigned short u16;

extern int func_0202f994(int id);

int func_ov002_022920d0(struct Ov002Self *self) {
    int k;
    for (k = 0; k < 5; k++) {
        u16 s2 = *(u16 *)((char *)self + 2);
        int bit0 = (int)(((unsigned int)(s2 << 31)) >> 31) & 1;
        char *row = (char *)data_ov002_022cf08c + bit0 * 0x868;
        struct Ov002Slot *slotp = (struct Ov002Slot *)(row + 0x30 + k * 0x14);
        int id = slotp->id;
        if (func_0202f994(id) != 0) {
            u16 s2b = *(u16 *)((char *)self + 2);
            int bit0b = (int)(((unsigned int)(s2b << 31)) >> 31) & 1;
            char *row2 = (char *)data_ov002_022cf08c + bit0b * 0x868;
            if (*(u16 *)(row2 + k * 0x14 + 0x38) == 0)
                return 1;
        }
    }
    return 0;
}
