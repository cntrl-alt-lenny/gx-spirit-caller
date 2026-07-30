#include "ov002_core.h"

extern int func_ov002_0223de48(struct Ov002Self *self, int a, int b);
extern int func_ov002_02257564(struct Ov002Self *self, int a, int b);
extern int func_ov002_021de3e8(struct Ov002Self *self, int a, int b);
extern void func_ov002_021df728(struct Ov002Self *self, int a, int b);

int func_ov002_022220ec(struct Ov002Self *self) {
    if (func_ov002_0223de48(self, 0, 0) != 0) {
        unsigned int packed = func_ov002_0223dda4(self, 0);
        int byte0 = packed & 0xff;
        int byte1 = ((unsigned short)packed >> 8) & 0xff;
        if (func_ov002_02257564(self, byte0, byte1) != 0) {
            func_ov002_021e2a4c();
            if (func_ov002_021de3e8(self, byte0, byte1) != 0) {
                func_ov002_021df728(self, byte0, 0x1f4);
            }
            func_ov002_021e2b6c();
        }
    }
    return 0;
}
