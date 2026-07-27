#include "ov002_core.h"
extern char data_ov002_022cf26c[];
extern void func_ov002_0226af38(int a, int b, int c);

int func_ov002_0222ce30(struct Ov002Self *self) {
    int b0 = self->b0;
    int off = (b0 & 1) * 0x868;
    unsigned short v = *(unsigned short *)(data_ov002_022cf26c + off);
    if (v == 0) return 0;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + off + 0xf8))->id != 0x169f) return 0;
    func_ov002_0226af38(1 - b0, 1, 3);
    return 0;
}
