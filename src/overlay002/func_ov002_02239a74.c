#include "ov002_core.h"

extern char data_ov002_022d0e6c[];

extern void func_ov002_0226af78(int a, int b);
extern int func_ov002_021e278c(int a, int b);
extern int func_ov002_021e276c(unsigned int bit, unsigned short f0, unsigned int k, unsigned int fld);

struct Slot518 {
    unsigned int id     : 13;
    unsigned int flag13 : 1;
    unsigned int _pad   : 8;
    unsigned int sub    : 8;
    unsigned int _pad2  : 2;
};

int func_ov002_02239a74(struct Ov002Self *self) {
    int state = CE288->f_5a8;

    if (state == 0x7f)
        goto case_7f;

    if (state == 0x80) {
        if (*(int *)((char *)data_ov002_022cf178 + ((1 - self->b0) & 1) * 0x868) == 0)
            return 0;
        func_ov002_0226af78(1 - self->b0, 0);
        return 0x7f;
    }

    goto default_case;

case_7f:
    {
        u16 idx = *(u16 *)((char *)data_ov002_022d0e6c + 0xb0);
        struct Slot518 *slot = (struct Slot518 *)((char *)data_ov002_022cf16c + ((1 - self->b0) & 1) * 0x868 + 0x120 + idx * 4);
        int want2 = slot->sub * 2 + slot->flag13;
        int id = slot->id;

        func_ov002_021e278c(1 - self->b0, want2);
        func_ov002_021e276c(self->b0, self->f0, 0x11, (u16)id);
        return 0;
    }

default_case:
    return 0;
}
