#include "ov002_core.h"

struct Self8028 {
    u16 f0;
    u16 b0    : 1;
    u16 idx5  : 5;
    u16 pad   : 10;
    u16 f4;
    u16 f6;
    u16 f8;
};

extern char data_ov002_022cf0c8[];
extern int func_ov002_021e2ca4(int b0, int idx, int a, int b);
extern int func_ov002_021d8fd0(int b0, int idx, int c);

int func_ov002_021f7f38(struct Self8028 *self) {
    self->f8 = *(int *)(data_ov002_022cf0c8 + (self->b0 & 1) * 0x868 + self->idx5 * 0x14);
    func_ov002_021e2ca4(self->b0, self->idx5, 5, 0);
    func_ov002_021d8fd0(self->b0, self->idx5, 0);
    return 1;
}
