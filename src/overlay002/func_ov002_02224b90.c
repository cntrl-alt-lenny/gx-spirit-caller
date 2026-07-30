#include "ov002_core.h"

extern int func_ov002_021e104c(int player, int kind);
extern void func_ov002_021e276c(int bit0, unsigned short f0, int kind, int fld);

struct SelfF4Bit2 { u16 pad:2; u16 bit2:1; u16 rest:13; };

int func_ov002_02224b90(struct Ov002Self *self) {
    struct SelfF4Bit2 *f4bits = (struct SelfF4Bit2 *)((char *)self + 4);
    if (f4bits->bit2 != 0) return 0;
    if (func_ov002_021e104c(self->b0, 2) != 0) {
        int match = (D016C->f_cec == self->b0) ? 1 : 0;
        unsigned char tmp = (unsigned char)(match + 3);
        u16 packed = (tmp << 4) | 1;
        func_ov002_021e276c(self->b0, self->f0, packed, 0);
    }
    return 0;
}
