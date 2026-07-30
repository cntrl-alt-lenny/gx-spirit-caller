#include "ov002_core.h"

typedef unsigned short u16;

extern char data_ov002_022cf178[];
extern int func_ov002_022536e8(int bit0, int f0, int idx);

int func_ov002_0220717c(struct Ov002Self *self) {
    u16 s2 = *(u16 *)((char *)self + 2);
    int bit0 = (int)(((unsigned int)(s2 << 31)) >> 31);
    int off = (bit0 & 1) * 0x868;
    unsigned int count = *(unsigned int *)((char *)data_ov002_022cf178 + off);
    unsigned int i;
    for (i = 0; i < count; i++) {
        if (func_ov002_022536e8(bit0, self->f0, i) != 0)
            return 1;
        s2 = *(u16 *)((char *)self + 2);
        bit0 = (int)(((unsigned int)(s2 << 31)) >> 31);
        count = *(unsigned int *)((char *)data_ov002_022cf16c + (bit0 & 1) * 0x868 + 0xc);
    }
    return 0;
}
