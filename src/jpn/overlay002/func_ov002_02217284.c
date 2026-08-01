#include "ov002_core.h"

struct Self {
    u16 f0;
    u16 b0     : 1;
    u16 _pad1  : 5;
    u16 kind   : 6;
    u16 f12_13 : 2;
    u16 _pad2  : 2;
};

extern int func_ov002_021e267c(unsigned int bit, unsigned short f0, unsigned int k, unsigned int z);
extern void func_ov002_021ae320(int a, int b);
extern void func_ov002_021d5a90(unsigned int bit, unsigned int fld, unsigned short f0, unsigned int z);
extern int func_ov002_0221d198(void *self, int arg1);

int func_ov002_02217284(struct Self *self, int arg1) {
    u16 f2 = *(u16 *)((char *)self + 2);
    unsigned int f12_13 = ((unsigned)(f2 << 18)) >> 30;

    if (f12_13 != 2 || ((unsigned)(f2 << 20)) >> 26 == 0x23) {
        func_ov002_021e267c(self->b0, self->f0, 1, 0);
        func_ov002_021ae320(self->b0, 0xa2);
        return 0;
    }

    if (CE288->f_5a8 == 0x80) {
        unsigned int b0 = ((unsigned)(f2 << 31)) >> 31;
        func_ov002_021d5a90(b0, 0xb, self->f0, 0);
    }
    return func_ov002_0221d198(self, arg1);
}
