/* func_ov002_0221762c: gate self->f4.bit2, then switch on
 * CE288->f_5a8 (0x7e/0x7f/0x80) to dispatch func_ov002_021e2b6c,
 * func_ov002_0226ac6c, or (gated by the per-player cf178 count)
 * func_ov002_021e2a4c + func_ov002_0226ae48. */
#include "ov002_core.h"

struct Self0221771c_F4 {
    unsigned short _pad0_1 : 2;
    unsigned short bit2 : 1;
    unsigned short _rest : 13;
};
struct Self0221771c {
    unsigned short f0;
    unsigned short f2;
    struct Self0221771c_F4 f4;
    unsigned short f6;
    unsigned short f8;
};

extern void func_ov002_0226ae48(int a, int b, int c);
extern void func_ov002_0226ac6c(int bit0, int one, int z1, int z2);

int func_ov002_0221762c(struct Self0221771c *self) {
    int player = self->f8 & 1;

    if (self->f4.bit2 != 0) return 0;

    switch (CE288->f_5a8) {
    case 0x80:
        if (*(int *)((char *)data_ov002_022cf098 + (player & 1) * 0x868) == 0) return 0;
        func_ov002_021e2a4c();
        func_ov002_0226ae48(player, 1, 1);
        return 0x7f;
    case 0x7f:
        func_ov002_0226ac6c(player, 1, 0, 1);
        return 0x7e;
    case 0x7e:
        func_ov002_021e2b6c();
        return 0;
    default:
        return 0;
    }
}
