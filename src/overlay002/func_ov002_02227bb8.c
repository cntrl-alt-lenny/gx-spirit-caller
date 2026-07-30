#include "ov002_core.h"

typedef unsigned char u8;
typedef unsigned short u16;

extern int func_ov002_0223df38(struct Ov002Self *self, int a, unsigned int *out);
extern int func_ov002_0225764c(struct Ov002Self *self, int a, int b);
extern void func_ov002_021d5a08(struct Ov002Self *self, int a, int b, int f0, int c5, int c6);
extern void func_ov002_021e276c(int a, int f0, int b, int c);

int func_ov002_02227bb8(struct Ov002Self *self) {
    unsigned int packed;
    if (func_ov002_0223df38(self, 0, &packed) != 0) {
        int byte0 = packed & 0xff;
        int byte1 = ((unsigned short)packed >> 8) & 0xff;
        if (func_ov002_0225764c(self, byte0, byte1) != 0) {
            func_ov002_021d5a08(self, byte0, byte1, self->f0, 2, 1);
            func_ov002_021e276c(byte0, self->f0, 1, 0);
        }
    }
    return 0;
}
