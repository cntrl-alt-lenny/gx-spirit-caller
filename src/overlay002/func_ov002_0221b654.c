#include "ov002_core.h"

struct Ov002SelfExt {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short field1_5 : 5;
    unsigned short _rest : 10;
};

struct Ov002Field4 {
    unsigned short _pad_lo : 6;
    unsigned short f6_9 : 9;
    unsigned short _pad_hi : 1;
};

struct Ov002SlotFull {
    unsigned int id : 13;
    unsigned int bit13 : 1;
    unsigned int mid8 : 8;
    unsigned int hi8 : 8;
    unsigned int top2 : 2;
};

extern void func_ov002_021e2d94(int b0, int idx, int c, int d);

int func_ov002_0221b654(struct Ov002SelfExt *self) {
    struct Ov002Field4 *f4 = (struct Ov002Field4 *)((char *)self + 4);
    char *row = (char *)data_ov002_022cf16c + (self->b0 & 1) * 0x868;
    int idx = self->field1_5;
    struct Ov002SlotFull *slot = (struct Ov002SlotFull *)(row + 0x30 + idx * 0x14);

    if (f4->f6_9 != slot->hi8 * 2 + slot->bit13) {
        return 0;
    }
    func_ov002_021e2d94(self->b0, idx, 5, 1);
    return 0;
}
