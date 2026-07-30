#include "ov002_core.h"

typedef unsigned short u16;

extern int func_ov002_0223de48(struct Ov002Self *self, int a, int b);
extern int func_ov002_02257564(struct Ov002Self *self, int a, int b);
extern int func_ov002_021c8400(int a, int b);
extern void func_ov002_021e267c(int a, int f0, int b, int c);

int func_ov002_0222e0cc(struct Ov002Self *self) {
    if (func_ov002_0223de48(self, 0, 0) != 0) {
        unsigned int packed = func_ov002_0223dda4(self, 0);
        int byte0 = packed & 0xff;
        int byte1 = ((unsigned short)packed >> 8) & 0xff;
        if (func_ov002_02257564(self, byte0, byte1) != 0) {
            int r = func_ov002_021c8400(byte0, byte1);
            func_ov002_021e267c(self->b0, self->f0, 0x11, (u16)r);
        }
    }
    return 0;
}
