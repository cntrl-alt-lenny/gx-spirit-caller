#include "ov002_core.h"

extern int func_ov002_021ba230(int player, int arg1);
extern int func_ov002_021ca1d8(int a, int _unused, int c, int d);
extern int func_ov002_021bc538(int arg0);
extern int func_ov002_0227acc8(int a, int b, int c, int d);

int func_ov002_02230f04(struct Ov002Self *self) {
    int r4;

    r4 = func_ov002_021ba230(self->b0, *(unsigned short *)((char *)self + 8));
    if (((int (*)(int, int))func_ov002_021ca1d8)(self->b0, *(unsigned short *)((char *)self + 2)) == 0)
        return 0;
    if (func_ov002_021bc538(self->b0) == 0)
        return 0;
    if (r4 >= 0) {
        func_ov002_0227acc8(self->b0,
            (int)((char *)data_ov002_022cf08c + (self->b0 & 1) * 0x868 + 0x3a0 + r4 * 4),
            1, 0);
    }
    return 0;
}
