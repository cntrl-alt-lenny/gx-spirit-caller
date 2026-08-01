#include "ov002_core.h"

struct RowFields {
    unsigned int id     : 13;
    unsigned int bit13  : 1;
    unsigned int _pad   : 8;
    unsigned int fieldA : 8;
    unsigned int _pad2  : 2;
};

struct Self {
    u16 f0;
    u16 b0    : 1;
    u16 p5    : 5;
    u16 _pad1 : 10;
    u16 _pad2 : 6;
    u16 nine  : 9;
    u16 _pad3 : 1;
};

extern int func_ov002_021d92f0(unsigned int bit, unsigned int multi, int sentinel);

int func_ov002_0222fe34(struct Self *self) {
    char *rowBase = (char *)data_ov002_022cf08c + (self->b0 & 1) * 0x868 + 0x30;
    struct RowFields *row = (struct RowFields *)(rowBase + self->p5 * 20);

    if (self->nine != row->fieldA * 2 + row->bit13)
        return 0;

    if (*(unsigned short *)((char *)data_ov002_022cf0c4 + (self->b0 & 1) * 0x868 + self->p5 * 20) == 0)
        return 0;

    func_ov002_021d92f0(self->b0, self->p5, ~0);
    return 0;
}
